import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/environment/flavor.dart';
import 'package:movie_app/main.dart';

import 'package:movie_app/firebase_options_prod.dart';
import 'package:movie_app/services/notification_service.dart';

Future<void> main() async {
  await startUp(DefaultFirebaseOptions.currentPlatform);
  flavor = Flavor.prod;
  runApp(const MyApp());
}
