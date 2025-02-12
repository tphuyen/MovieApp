import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

class SavedMovieViewModel extends ChangeNotifier {
  List<Movie> _savedMovies = [];

  List<Movie> get savedMovies => _savedMovies;

  bool isSaved(Movie movie) {
    return _savedMovies.any((savedMovie) => savedMovie.id == movie.id);
  }

  void toggleSave(Movie movie) {
    List<Movie> updatedMovies = List.from(_savedMovies);
    if (isSaved(movie)) {
      updatedMovies.removeWhere((savedMovie) => savedMovie.id == movie.id);
    } else {
      updatedMovies.add(movie);
    }
    _savedMovies = updatedMovies;
    notifyListeners();
  }
}
