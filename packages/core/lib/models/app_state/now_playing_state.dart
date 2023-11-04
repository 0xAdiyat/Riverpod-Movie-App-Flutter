import 'package:freezed_annotation/freezed_annotation.dart';

import '../tmdb/tmdb_movie_basic.dart';

part 'now_playing_state.freezed.dart';

@freezed
class NowPlayingState with _$NowPlayingState {
  const factory NowPlayingState.data(
      List<TMDBMovieBasic> movies, bool hasReachedMax) = _Data;
  const factory NowPlayingState.dataLoading(List<TMDBMovieBasic> movies) =
      _DataLoading;
  const factory NowPlayingState.error(String errorText) = _Error;
}
