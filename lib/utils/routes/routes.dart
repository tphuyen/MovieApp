import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes/routes_names.dart';
import 'package:movie_app/view/movie_page.dart';
import 'package:movie_app/view/save_page.dart';
import 'package:movie_app/view/ticket_page.dart';


class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.movies:
        return MaterialPageRoute(builder: (_) => const MoviesPage());
      case RoutesNames.tickets:
        return MaterialPageRoute(builder: (_) => const TicketsPage());
      case RoutesNames.saved:
        return MaterialPageRoute(builder: (_) => const SavedPage());
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
