import 'package:core/models/app_models/profile.dart';
import 'package:core/models/app_models/profiles_data.dart';
import 'package:core/models/tmdb/tmdb_movie_basic.dart';
import 'package:core/persistence/data_store.dart';

import 'data_store.dart';

class StorePath {
  static const profiles = 'profiles';
  static const movies = 'movies';
  static String favouriteMovie(String profileId, int movieId) =>
      'favourites/$profileId/movie/$movieId';

  static String favouriteMovies(String profileId) => 'favourites/$profileId';
}

class SembastDataStore implements DataStore {
  static DatabaseFactory dbFactory = databaseFactoryIo;
  @override
  Stream<List<TMDBMovieBasic>> allSavedMovies() {
    // TODO: implement allSavedMovies
    throw UnimplementedError();
  }

  @override
  Future<void> createProfile(Profile profile) {
    // TODO: implement createProfile
    throw UnimplementedError();
  }

  @override
  Stream<List<int>> favouriteMovieIDs({required String profileId}) {
    // TODO: implement favouriteMovieIDs
    throw UnimplementedError();
  }

  @override
  Stream<List<TMDBMovieBasic>> favouriteMovies({required String profileId}) {
    // TODO: implement favouriteMovies
    throw UnimplementedError();
  }

  @override
  Future<ProfilesData> getProfilesData() {
    // TODO: implement getProfilesData
    throw UnimplementedError();
  }

  @override
  Future<bool> profileExistWithName(String name) {
    // TODO: implement profileExistWithName
    throw UnimplementedError();
  }

  @override
  Stream<ProfilesData> profilesData() {
    // TODO: implement profilesData
    throw UnimplementedError();
  }

  @override
  Future<void> setFavouriteMovie(
      {required String profileId,
      required TMDBMovieBasic move,
      required bool isFavourite}) {
    // TODO: implement setFavouriteMovie
    throw UnimplementedError();
  }

  @override
  Future<void> setSelectedProfile(Profile profile) {
    // TODO: implement setSelectedProfile
    throw UnimplementedError();
  }
}
