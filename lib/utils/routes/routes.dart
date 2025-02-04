import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes/routes_names.dart';
import 'package:movie_app/view/movie_detail_page.dart';

import 'package:movie_app/model/movie.dart';


class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.movieDetail:
        final movie = settings.arguments as Movie;
        return MaterialPageRoute(
          builder: (_) => MovieDetailPage(movie: movie),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
