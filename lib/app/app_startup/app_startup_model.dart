import 'dart:async';

import 'package:core/models/app_state/app_startup_state.dart';
import 'package:core/persistence/data_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartupModel extends StateNotifier<AppStartupState> {
  AppStartupModel({required this.dataStore})
      : super(const AppStartupState.initializing());
  final DataStore dataStore;
  late StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void init() {
    _subscription = dataStore.profilesData().listen((profilesData) {
      if (profilesData.selectedId == null || profilesData.profiles.isEmpty) {
        state = const AppStartupState.needsProfile();
      } else {
        state = AppStartupState.profileLoaded(profilesData);
      }
    });
  }
}
