import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/services/notification_service.dart';
import 'package:movie_app/utils/bottom_navigation/custom_bottom_navbar.dart';
import 'package:movie_app/utils/routes/routes.dart';
import 'package:movie_app/utils/routes/routes_names.dart';
import 'package:movie_app/viewmodel/base_view_model.dart';
import 'package:movie_app/viewmodel/home_view_model.dart';
import 'package:movie_app/viewmodel/movie_view_model.dart';
import 'package:movie_app/viewmodel/save_movie_view_model.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/environment/flavor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

late Flavor flavor;

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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