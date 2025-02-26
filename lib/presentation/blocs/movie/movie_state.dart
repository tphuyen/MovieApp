import 'package:equatable/equatable.dart';
import 'package:movie_app/model/movie.dart';

abstract class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final Movie? movieDetails;
  final bool isLoading;
  final String? errorMessage;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.movieDetails,
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [nowPlayingMovies, popularMovies, movieDetails, isLoading, errorMessage];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {
  const MovieLoading() : super(isLoading: true);
}

class MovieLoaded extends MovieState {
  const MovieLoaded({
    required super.nowPlayingMovies,
    required super.popularMovies,
  });
}

class MovieDetailsLoaded extends MovieState {
  const MovieDetailsLoaded(Movie movieDetails)
      : super(movieDetails: movieDetails);
}

class MovieError extends MovieState {
  const MovieError(String errorMessage) : super(errorMessage: errorMessage);
}
