import 'package:flutter/material.dart';
import 'package:movie_app/utils/bottom_navigation/bottom_nav_wrapper.dart';
import 'package:movie_app/utils/routes/routes.dart';
import 'package:movie_app/utils/routes/routes_names.dart';
import 'package:movie_app/viewmodel/save_movie.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SavedMovieProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesNames.movies,
      onGenerateRoute: AppRoutes.generateRoute,
      home: BottomNavWrapper(),
    );
  }
}
