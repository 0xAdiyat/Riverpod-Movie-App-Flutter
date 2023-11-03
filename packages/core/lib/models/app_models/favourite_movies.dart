import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

class FavouriteMovies {
  final Set<int> favouriteIDs;

  FavouriteMovies({required this.favouriteIDs});

  String toJson() => json.encode(favouriteIDs.toList());

  factory FavouriteMovies.fromJson(String source) {
    final list = json.decode(source);
    return FavouriteMovies(favouriteIDs: Set<int>.from(list));
  }

  @override
  String toString() {
    return 'FavouriteMovies{favouriteIDs: $favouriteIDs}';
  }

  @override
  int get hashCode => favouriteIDs.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final setEquals = const DeepCollectionEquality().equals;
    return other is FavouriteMovies &&
        setEquals(other.favouriteIDs, favouriteIDs);
  }
}
