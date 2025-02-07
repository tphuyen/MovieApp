import 'package:movie_app/data/remote/api/api_service.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/cast.dart';

enum MovieCategory { popular, nowPlaying }
class MovieRepository {
  final ApiService apiService;

  MovieRepository(this.apiService);

  Future<List<Movie>> fetchMovies({required MovieCategory category, int page = 1}) async {
    final fetchMap = {
      MovieCategory.popular: apiService.getPopularMovies,
      MovieCategory.nowPlaying: apiService.getPlayingMovies,
    };

    try {
      final fetchMethod = fetchMap[category];
      if (fetchMethod != null) {
        return await fetchMethod(page: page);
      }
      throw Exception("Unsupported MovieCategory: $category");
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }


  Future<Movie> fetchMovieDetails(int movieId) async {
    try {
      final results = await Future.wait([
        apiService.getMovieDetail(movieId),
        apiService.getMovieCredits(movieId),
      ]);

      Movie updatedMovie = results[0] as Movie;
      List<CastMember> cast = results[1] as List<CastMember>;

      updatedMovie.cast = cast;

      return updatedMovie;
    } catch (e) {
      throw Exception('Failed to fetch movie details: $e');
    }
  }

}
