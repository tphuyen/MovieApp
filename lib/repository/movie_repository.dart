import 'package:movie_app/data/remote/api/api_service.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/cast.dart';

class MovieRepository {
  final ApiService apiService;

  MovieRepository(this.apiService);

  Future<List<Movie>> fetchPopularMovies({int page = 1}) async {
      return await apiService.getPopularMovies(page: page);
  }

  Future<List<Movie>> fetchNowPlayingMovies({int page = 1}) async {
      return await apiService.getPlayingMovies(page: page);
  }

  Future<Movie> fetchMovieDetail(int movieId) async {
      return await apiService.getMovieDetail(movieId);
  }

  Future<List<CastMember>> fetchMovieCredits(int movieId) async {
      return await apiService.getMovieCredits(movieId);
  }
}

