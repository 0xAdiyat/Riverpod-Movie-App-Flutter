import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/ui/movies_grid.dart';
import 'package:core/ui/scrollable_movies_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../top_level_providers.dart';

final profileFavouriteMoviesProvider =
    StreamProvider.autoDispose<List<TMDBMovieBasic>>((ref) {
  final dataStore = ref.watch(dataStoreProvider);
  final profilesData = ref.watch(profilesDataProvider);
  if (profilesData.selectedId != null) {
    return dataStore.favouriteMovies(profileId: profilesData.selectedId!);
  } else {
    throw UnimplementedError();
  }
});

// final profileFavouriteMoviesProvider =
//     StreamProvider.autoDispose<TMDBMovieBasic>((ref) {
//   final dataStore = ref.watch(dataStoreProvider);
//   final profilesData = ref.watch(profilesDataProvider);
//
//   if (profilesData.selectedId != null) {
//     return dataStore
//         .favouriteMovies(profileId: profilesData.selectedId!)
//         .map((movies) {
//       if (movies.isNotEmpty) {
//         return movies.first;
//       } else {
//         throw UnimplementedError();
//       }
//     });
//   } else {
//     throw UnimplementedError();
//   }
// });
class FavouritesPage extends ConsumerWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final profileFavouriteMovies = ref.watch(profileFavouriteMoviesProvider);
    return profileFavouriteMovies.when(
        data: (movies) => ScrollableMoviesPageBuilder(
            title: 'Favourites',
            builder: (_, __) => MoviesGrid(movies: movies)),
        error: (_, __) => Container(),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
