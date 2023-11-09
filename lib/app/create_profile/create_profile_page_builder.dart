import 'package:core/models/app_state/create_profile_state.dart';
import 'package:core/ui/create_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_movie_app/app/create_profile/create_profile_model.dart';
import 'package:riverpod_movie_app/top_level_providers.dart';

final createProfileModelProvider =
    StateNotifierProvider<CreateProfileModel, CreateProfileState>((ref) {
  final dataStore = ref.read(dataStoreProvider);
  return CreateProfileModel(dataStore: dataStore);
});

class CreateProfilePageBuilder extends ConsumerWidget {
  const CreateProfilePageBuilder({super.key});

  Future<void> createProfile(
      BuildContext context, WidgetRef ref, String name) async {
    final model = ref.read(createProfileModelProvider.notifier);
    final success = await model.createProfile(name);
    if (success) {
      if (context.mounted) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(createProfileModelProvider);
    return CreateProfilePage(
      onSubmit: (name) => createProfile(context, ref, name),
      isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
      errorText: state.maybeWhen(orElse: () => null, error: (err) => err),
    );
  }
}
