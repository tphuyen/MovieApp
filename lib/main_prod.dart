import 'package:flutter/material.dart';
import 'package:movie_app/environment/flavor.dart';
import 'package:movie_app/main.dart';

void main() {
  flavor = Flavor.prod;
  runApp(const MyApp());
}
