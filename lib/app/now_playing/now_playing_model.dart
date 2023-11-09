import 'package:core/api/tmdb_api.dart';
import 'package:core/models/app_state/now_playing_state.dart';
import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/models/tmdb/tmdb_movies_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NowPlayingModel extends StateNotifier<NowPlayingState> {
  NowPlayingModel({required this.api})
      : super(const NowPlayingState.data([], false));

  final TMDBClient api;

  // Keep track of same variabeles;
  int _page = 0;
  final List<TMDBMovieBasic> _movies = [];

  void init() {
    if (_page == 0) {
      fetchNextPage();
    }
  }

  bool get _canLoadNextPage => state.maybeWhen(
      orElse: () => false,
      dataLoading: (_) => false,
      data: (_, hasReachedMax) => !hasReachedMax);

  Future<void> fetchNextPage() async {
    if (!_canLoadNextPage) {
      return;
    }
    _page += 1;
    debugPrint("Fetching page $_page");

    try {
      state = NowPlayingState.dataLoading(_movies);
      final TMDBMoviesResponse results =
          await api.nowPlayingMovies(page: _page);
      if (results.isEmpty) {
        state = NowPlayingState.data(_movies, true);
      } else {
        state = NowPlayingState.data(_movies..addAll(results.results), false);
      }
    } catch (e) {
      state = NowPlayingState.error(e.toString());
    }
  }
}
