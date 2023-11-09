import 'package:core/ui/profiles_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_movie_app/app/create_profile/create_profile_page_builder.dart';
import 'package:riverpod_movie_app/top_level_providers.dart';

class ProfileSelectionPage extends ConsumerWidget {
  const ProfileSelectionPage({super.key});

  Future<void> addProfile(BuildContext context) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
          builder: (_) => const CreateProfilePageBuilder(), fullscreenDialog: true),
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    final profilesData = ref.watch(profilesDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile selection'),
      ),
      body: ProfilesGrid(
        profilesData: profilesData,
        onAddProfile: () => addProfile(context),
        onSelectedProfile: (profile) async {
          final dataStore = ref.read(dataStoreProvider);
          await dataStore.setSelectedProfile(profile);
        },
      ),
    );
  }
}
