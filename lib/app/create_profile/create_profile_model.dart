import 'package:core/models/app_models/profile.dart';
import 'package:core/models/app_state/create_profile_state.dart';
import 'package:core/persistence/data_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class CreateProfileModel extends StateNotifier<CreateProfileState> {
  final DataStore dataStore;

  CreateProfileModel({required this.dataStore})
      : super(const CreateProfileState.loading());

  Future<bool> createProfile(String name) async {
    if (name.isEmpty) {
      state = const CreateProfileState.error("Name can\'t be empty");
      return false;
    }
    final nameExists = await dataStore.profileExistWithName(name);
    if (nameExists) {
      state = const CreateProfileState.error("Name already taken");
    }
    final id = const Uuid().v1();
    state = const CreateProfileState.loading();

    try {
      await dataStore.createProfile(Profile(id: id, name: name));
      state = const CreateProfileState.noError();
    } catch (e) {
      state = CreateProfileState.error(e.toString());
    }
    return true;
  }
}
