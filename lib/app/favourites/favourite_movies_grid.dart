import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/ui/favourite_button.dart';
import 'package:core/ui/movies_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_movie_app/top_level_providers.dart';

final favouriteMovieProvider =
    StreamProvider.autoDispose.family<bool, TMDBMovieBasic>((ref, movie) {
  final dataStore = ref.watch(dataStoreProvider);
  final profilesData = ref.watch(profilesDataProvider);
  if (profilesData.selectedId != null) {
    return dataStore.favouriteMovie(
        profileId: profilesData.selectedId!, movie: movie);
  }
  return const Stream.empty();
});

class FavouriteMoviesGrid extends StatelessWidget {
  const FavouriteMoviesGrid(
      {super.key, required this.movies, required this.controller});
  final List<TMDBMovieBasic> movies;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return MoviesGrid(
      movies: movies,
      controller: controller,
      favouriteBuilder: (context, movie) {
        return Consumer(
          builder: (_, ref, __) {
            final favouriteMovie = ref.watch(favouriteMovieProvider(movie));
            return favouriteMovie.when(
                data: (isFavourite) => FavouriteButton(
                    isFavourite: isFavourite,
                    onFavouriteChanged: (isFavourite) {
                      final profilesData = ref.read(profilesDataProvider);
                      if (profilesData.selectedId != null) {
                        final dataStore = ref.read(dataStoreProvider);
                        dataStore.setFavouriteMovie(
                            profileId: profilesData.selectedId!,
                            movie: movie,
                            isFavourite: isFavourite);
                      }
                    }),
                error: (_, __) => Container(),
                loading: () => Container());
          },
        );
      },
    );
  }
}
