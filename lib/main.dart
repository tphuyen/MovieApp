import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/remote/api/api_client.dart';
import 'package:movie_app/data/remote/api/api_service.dart';
import 'package:movie_app/presentation/blocs/base/base_bloc.dart';
import 'package:movie_app/presentation/blocs/home/home_bloc.dart';
import 'package:movie_app/presentation/blocs/movie/movie_bloc.dart';
import 'package:movie_app/presentation/blocs/movie/movie_event.dart';
import 'package:movie_app/presentation/blocs/saved_movie/saved_movie_bloc.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:movie_app/services/notification_service.dart';
import 'package:movie_app/utils/bottom_navigation/custom_bottom_navbar.dart';
import 'package:movie_app/utils/routes/routes.dart';
import 'package:movie_app/utils/routes/routes_names.dart';
import 'package:movie_app/environment/flavor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

late Flavor flavor;

Future<void> startUp(FirebaseOptions firebaseOptions) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("FCM token: $fcmToken");
  await NotificationService.instance.initialize();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final MovieRepository movieRepository;

  @override
  void initState() {
    super.initState();
    final apiClient = ApiClient();
    final apiService = ApiService(apiClient);
    movieRepository = MovieRepository(apiService);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => BaseBloc()),
        BlocProvider(create: (_) => MovieBloc(movieRepository)..add(FetchMovies())),
        BlocProvider(create: (_) => SavedMovieBloc()),
      ],
      child: MaterialApp(
        title: "Movie App (${flavor.name})",
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesNames.movies,
        onGenerateRoute: AppRoutes.generateRoute,
        home: const CustomBottomNavBar(),
      ),
    );
  }
}
