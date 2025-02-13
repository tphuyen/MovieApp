import 'package:flutter/material.dart';
import 'package:movie_app/utils/bottom_navigation/custom_bottom_navbar.dart';
import 'package:movie_app/utils/routes/routes.dart';
import 'package:movie_app/utils/routes/routes_names.dart';
import 'package:movie_app/viewmodel/base_view_model.dart';
import 'package:movie_app/viewmodel/home_view_model.dart';
import 'package:movie_app/viewmodel/movie_view_model.dart';
import 'package:movie_app/viewmodel/save_movie_view_model.dart';
import 'package:provider/provider.dart';

import 'package:movie_app/environment/flavor.dart';

late Flavor flavor;

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BaseViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => MovieViewModel()),
        ChangeNotifierProvider(create: (_) => SavedMovieViewModel()),
      ],
      child: MaterialApp(
        title: "Movie App (${flavor.name})",
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesNames.movies,
        onGenerateRoute: AppRoutes.generateRoute,
        home: CustomBottomNavBar(),
      ),
    );
  }
}
