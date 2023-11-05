import 'package:core/ui/poster_tile.dart';
import 'package:flutter/material.dart';

import '../models/tmdb/tmdb_movie_basic.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid(
      {super.key,
      required this.movies,
      this.controller,
      this.favouriteBuilder});

  final List<TMDBMovieBasic> movies;
  final ScrollController? controller;
  final Widget Function(BuildContext, TMDBMovieBasic)? favouriteBuilder;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: screenSize.width / 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 185.0 / 278.0,
        ),
        itemCount: movies.length,
        controller: controller,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return PosterTile(
              imagePath: movie.posterPath,
              favouriteBuilder: favouriteBuilder != null
                  ? (context) => favouriteBuilder!.call(context, movie)
                  : null);
        });
  }
}
