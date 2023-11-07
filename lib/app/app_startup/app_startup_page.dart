import 'package:core/ui/home_navigation_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_movie_app/top_level_providers.dart';

class AppStartupPage extends ConsumerWidget {
  const AppStartupPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final appStartup = ref.watch(appStartupModelProvider);
    return appStartup.when(
        initializing: () => const Center(child: CircularProgressIndicator()),
        needsProfile: () => ProfileSelectionPage(),
        profileLoaded: (profilesData) =>
            HomeNavigationBuilder(builder: (context, tabItem) {
              if (tabItem == TabItem.nowPlaying) {
                return NowPlayingPage();
              } else if (tabItem == TabItem.favourites) {
                return FavouritesPage();
              } else {
                return ProfileSelectionPage();
              }
            }));
  }
}
