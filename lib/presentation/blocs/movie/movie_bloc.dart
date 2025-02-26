import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/remote/api/api_client.dart';
import 'package:movie_app/data/remote/api/api_service.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:movie_app/presentation/blocs/movie/movie_event.dart';
import 'package:movie_app/presentation/blocs/movie/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;


  MovieBloc() :movieRepository = MovieRepository(ApiService(ApiClient())), super(MovieInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<FetchMovieDetails>(_onFetchMovieDetails);
  }

  Future<void> _onFetchMovies(FetchMovies event, Emitter<MovieState> emit) async {
    emit(const MovieLoading());
    try {
      final results = await Future.wait([
        movieRepository.fetchNowPlayingMovies(page: 1),
        movieRepository.fetchPopularMovies(page: 1),
      ]);

      emit(MovieLoaded(nowPlayingMovies: results[0], popularMovies: results[1]));
    } catch (e) {
      emit(MovieError("Error fetching movies: $e"));
    }
  }

  Future<void> _onFetchMovieDetails(FetchMovieDetails event, Emitter<MovieState> emit) async {
    emit(const MovieLoading());

    try {
      final results = await Future.wait([
        movieRepository.fetchMovieDetail(event.movieId),
        movieRepository.fetchMovieCredits(event.movieId),
      ]);

      final fetchedMovie = results[0] as Movie?;

      final fetchedCast = results[1] as List<CastMember>;

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
