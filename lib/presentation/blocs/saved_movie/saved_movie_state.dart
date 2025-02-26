import 'package:equatable/equatable.dart';
import 'package:movie_app/model/movie.dart';

abstract class SavedMovieState extends Equatable {
  const SavedMovieState();

  @override
  List<Object> get props => [];
}

class SavedMovieInitial extends SavedMovieState {}

class SavedMovieLoaded extends SavedMovieState {
  final List<Movie> savedMovies;

  const SavedMovieLoaded(this.savedMovies);

  @override
  List<Object> get props => [savedMovies];
}
