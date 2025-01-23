import 'package:flutter/material.dart';
import 'package:movie_app/home_page.dart';
import 'package:movie_app/model/save_movie.dart';
import 'package:movie_app/view/save/save_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SavedMovies(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MovieHomePage(),
        '/saved': (context) => const SavedPage(),
      },
    );
  }
}
