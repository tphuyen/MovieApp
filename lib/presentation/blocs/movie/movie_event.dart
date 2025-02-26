import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMovies extends MovieEvent {}

class FetchMovieDetails extends MovieEvent {
  final int movieId;
  FetchMovieDetails(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
