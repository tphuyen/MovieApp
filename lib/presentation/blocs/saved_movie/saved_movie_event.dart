import 'package:equatable/equatable.dart';
import 'package:movie_app/model/movie.dart';

abstract class SavedMovieEvent extends Equatable {
  const SavedMovieEvent();

  @override
  List<Object> get props => [];
}

class ToggleSaveMovie extends SavedMovieEvent {
  final Movie movie;

  const ToggleSaveMovie(this.movie);

  @override
  List<Object> get props => [movie];
}
