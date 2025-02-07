import 'package:flutter/material.dart';
import 'package:movie_app/data/remote/api/api_service.dart';
import 'package:movie_app/data/remote/api/api_client.dart';
import 'package:movie_app/model/movie.dart';

import 'package:movie_app/repository/movie_repository.dart';


class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository = MovieRepository(ApiService(ApiClient()));

  List<Movie> _nowPlayingMovies = [];
  List<Movie> _popularMovies = [];
  bool _isLoadingNowPlaying = true;
  bool _isLoadingPopular = true;

  Movie? _movieDetails;
  bool _isLoadingDetails = true;

  List<Movie> get nowPlayingMovies => _nowPlayingMovies;
  List<Movie> get popularMovies => _popularMovies;
  bool get isLoadingNowPlaying => _isLoadingNowPlaying;
  bool get isLoadingPopular => _isLoadingPopular;

  Movie? get movieDetails => _movieDetails;
  bool get isLoadingDetails => _isLoadingDetails;

  Future<void> fetchMovies() async {
    try {
      _nowPlayingMovies = await _movieRepository.fetchMovies(category: MovieCategory.nowPlaying);
      _popularMovies = await _movieRepository.fetchMovies(category: MovieCategory.popular);
    } catch (e) {
      print('Error fetching movies: $e');
    } finally {
      _isLoadingNowPlaying = false;
      _isLoadingPopular = false;
      notifyListeners();
    }
  }

  Future<void> fetchMovieDetails(int movieId) async {
    try {
      _movieDetails = await _movieRepository.fetchMovieDetails(movieId);
    } catch (e) {
      print('Error fetching movie details: $e');
    } finally {
      _isLoadingDetails = false;
      notifyListeners();
    }
  }
}
