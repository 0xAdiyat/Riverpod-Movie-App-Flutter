import 'package:core/api/tmdb_api.dart';
import 'package:core/models/app_state/now_playing_state.dart';
import 'package:core/ui/scrollable_movies_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_movie_app/app/favourites/favourite_movies_grid.dart';
import 'package:riverpod_movie_app/app/now_playing/now_playing_model.dart';

final moviesModelProvider =
    StateNotifierProvider<NowPlayingModel, NowPlayingState>(
        (ref) => NowPlayingModel(api: TMDBClient.makeDefault()));

class NowPlayingPage extends ConsumerWidget {
  static const moviesGridKey = Key("moviesGrid");
  const NowPlayingPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ScrollableMoviesPageBuilder(
      title: "Now Playing",
      onNextPageRequested: () {
        final moviesModel = ref.read(moviesModelProvider.notifier);
        moviesModel.fetchNextPage();
      },
      builder: (_, controller) {
        final state = ref.watch(moviesModelProvider);
        return state
          ..when(
            data: (movies, _) => FavouriteMoviesGrid(
              movies: movies,
              controller: controller,
              key: moviesGridKey,
            ),
            error: (err) => Center(
              child: Text(err),
            ),
            dataLoading: (movies) => movies.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : FavouriteMoviesGrid(
                    movies: movies, controller: controller, key: moviesGridKey),
          );
      },
    );
  }
}
