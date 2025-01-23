import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/model/movie.dart';

class SavedMovies with ChangeNotifier {
  final List<Movie> _savedMovies = [];

  List<Movie> get savedMovies => _savedMovies;

  bool isSaved(Movie movie) => _savedMovies.contains(movie);

  void toggleSave(Movie movie) {
    if (isSaved(movie)) {
      _savedMovies.remove(movie);
    } else {
      _savedMovies.add(movie);
    }
    notifyListeners();
  }
}
