import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/model/movie.dart';

class SavedMovieProvider with ChangeNotifier {
  List<Movie> _savedMovies = [];

  List<Movie> get savedMovies => _savedMovies;

  bool isSaved(Movie movie) => _savedMovies.contains(movie);

  void toggleSave(Movie movie) {
    if (isSaved(movie)) {
      _savedMovies = List.from(_savedMovies)..remove(movie);
    } else {
      _savedMovies = List.from(_savedMovies)..add(movie);
    }
    notifyListeners();
  }
}
