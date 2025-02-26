import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:movie_app/presentation/blocs/movie/movie_event.dart';
import 'package:movie_app/presentation/blocs/movie/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;


  MovieBloc(this.movieRepository) : super(MovieInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<FetchMovieDetails>(_onFetchMovieDetails);
  }

  Future<void> _onFetchMovies(FetchMovies event, Emitter<MovieState> emit) async {
    emit(const MovieLoading());
    try {
      final nowPlayingMovies = await movieRepository.fetchNowPlayingMovies(page: 1);
      final popularMovies = await movieRepository.fetchPopularMovies(page: 1);
      emit(MovieLoaded(nowPlayingMovies: nowPlayingMovies, popularMovies: popularMovies));
    } catch (e) {
      emit(MovieError("Error fetching movies: $e"));
    }
  }

  Future<void> _onFetchMovieDetails(FetchMovieDetails event, Emitter<MovieState> emit) async {
    emit(const MovieLoading());

    try {
      final fetchedMovie = await movieRepository.fetchMovieDetail(event.movieId);
      final fetchedCast = await movieRepository.fetchMovieCredits(event.movieId);

      if (fetchedMovie == null) {
        throw Exception("Movie details not found");
      }
      final movieDetail = fetchedMovie.copyWith(cast: fetchedCast);

      emit(MovieDetailsLoaded(movieDetail));
    } catch (e) {
      emit(MovieError("Failed to fetch movie details: $e"));
    }
  }
}
