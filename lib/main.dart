import 'package:flutter/material.dart';
import 'package:movie_app/utils/bottom_navigation/custom_bottom_navbar.dart';
import 'package:movie_app/utils/routes/routes.dart';
import 'package:movie_app/utils/routes/routes_names.dart';
import 'package:movie_app/viewmodel/home_view_model.dart';
import 'package:movie_app/viewmodel/save_movie_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SavedMovieProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider())
        ],
        child: const MaterialApp(
          title: 'Movie App',
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesNames.movies,
          onGenerateRoute: AppRoutes.generateRoute,
          home: CustomBottomNavBar(),
        ));
  }
}
