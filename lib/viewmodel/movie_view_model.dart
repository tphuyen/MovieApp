import 'package:flutter/material.dart';
import 'package:movie_app/data/remote/api/api_service.dart';
import 'package:movie_app/data/remote/api/api_client.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:movie_app/model/cast.dart';

class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository = MovieRepository(ApiService(ApiClient()));

  List<Movie> _nowPlayingMovies = [];
  List<Movie> _popularMovies = [];
  bool _isLoading = true;
  bool _isLoadingDetails = false;
  String? _errorMessage;
  Movie? _movieDetails;

  List<Movie> get nowPlayingMovies => _nowPlayingMovies;
  List<Movie> get popularMovies => _popularMovies;
  bool get isLoading => _isLoading;
  bool get isLoadingDetails => _isLoadingDetails;
  String? get errorMessage => _errorMessage;
  Movie? get movieDetails => _movieDetails;

  MovieProvider() {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final results = await Future.wait([
        _movieRepository.fetchPopularMovies(page: 1),
        _movieRepository.fetchNowPlayingMovies(page: 1),
      ]);

      _popularMovies = results[0];
      _nowPlayingMovies = results[1];
      _isLoading = false;
    } catch (e) {
      _errorMessage = "Error fetching movies: $e";
      _isLoading = false;
    }

    notifyListeners();
  }

  Future<void> fetchMovieDetails(int movieId) async {
    _isLoadingDetails = true;
    _movieDetails = null;
    notifyListeners();

    try {
      final results = await Future.wait([
        _movieRepository.fetchMovieDetail(movieId),
        _movieRepository.fetchMovieCredits(movieId),
      ]);

      _movieDetails = results[0] as Movie;
      _movieDetails = _movieDetails!.copyWith(cast: results[1] as List<CastMember>);
    } catch (e) {
      _errorMessage = 'Failed to fetch full movie details: $e';
    } finally {
      _isLoadingDetails = false;
      notifyListeners();
    }
  }
}

