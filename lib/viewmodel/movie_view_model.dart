import 'package:flutter/material.dart';
import 'package:movie_app/data/remote/api/api_service.dart';
import 'package:movie_app/data/remote/api/api_client.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/viewmodel/base_view_model.dart';

class MovieViewModel extends BaseViewModel {
  final MovieRepository _movieRepository = MovieRepository(ApiService(ApiClient()));

  List<Movie> _nowPlayingMovies = [];
  List<Movie> _popularMovies = [];
  Movie? _movieDetails;

  List<Movie> get nowPlayingMovies => _nowPlayingMovies;
  List<Movie> get popularMovies => _popularMovies;
  Movie? get movieDetails => _movieDetails;

  MovieViewModel() {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    setLoading(true);
    setError(null);

    try {
      final results = await Future.wait([
        _movieRepository.fetchPopularMovies(page: 1),
        _movieRepository.fetchNowPlayingMovies(page: 1),
      ]);

      _popularMovies = results[0];
      _nowPlayingMovies = results[1];
    } catch (e) {
      setError("Error fetching movies: $e");
    }finally{
      setLoading(false);
    }

    notifyListeners();
  }

  Future<void> fetchMovieDetails(int movieId) async {
    setLoading(true);
    _movieDetails = null;
    notifyListeners();

    try {
      final results = await Future.wait([
        _movieRepository.fetchMovieDetail(movieId),
        _movieRepository.fetchMovieCredits(movieId),
      ]);

      final fetchedMovie = results[0] as Movie?;

      final fetchedCast = results[1] as List<CastMember>;

      if (fetchedMovie == null) {
        throw Exception("Movie details not found");
      }

      _movieDetails = fetchedMovie.copyWith(cast: fetchedCast);
    } catch (e) {
      setError('Failed to fetch full movie details: $e');
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}

