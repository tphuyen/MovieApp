import 'package:movie_app/data/remote/api/api_service.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/cast.dart';

class MovieRepository {
  final ApiService apiService;

  MovieRepository(this.apiService);

  Future<List<Movie>> fetchPopularMovies({int page = 1}) async {
    try {
      return await apiService.getPopularMovies(page: page);
    } catch (e) {
      throw Exception('Failed to fetch popular movies: $e');
    }
  }

  Future<List<Movie>> fetchNowPlayingMovies({int page = 1}) async {
    try {
      return await apiService.getPlayingMovies(page: page);
    } catch (e) {
      throw Exception('Failed to fetch now playing movies: $e');
    }
  }

  Future<Movie> fetchMovieDetail(int movieId) async {
    try {
      return await apiService.getMovieDetail(movieId);
    } catch (e) {
      throw Exception('Failed to fetch movie detail: $e');
    }
  }

  Future<List<CastMember>> fetchMovieCredits(int movieId) async {
    try {
      return await apiService.getMovieCredits(movieId);
    } catch (e) {
      throw Exception('Failed to fetch movie credits: $e');
    }
  }
}

