import 'package:movie_app/data/remote/api/api_client.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/res/widgets/constants.dart';

class ApiService {
  final ApiClient dio;

  ApiService(this.dio);

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    try {
      final response = await dio.get(Constants.popularMovies, params: {'page': page});

      if (response.data != null && response.data['results'] != null) {
        var jsonList = response.data['results'] as List;
        return jsonList.map((json) => Movie.fromJson(json)).toList();
      }
      throw Exception('No results found or response is null');
    } catch (e) {
      throw Exception('Error fetching popular movies: $e');
    }
  }

  Future<List<Movie>> getPlayingMovies({int page = 1}) async {
    try {
      final response = await dio.get(Constants.nowPlayingMovies, params: {'page': page});

      if (response.data != null && response.data['results'] != null) {
        var jsonList = response.data['results'] as List;
        return jsonList.map((json) => Movie.fromJson(json)).toList();
      }
      throw Exception('No results found or response is null');
    } catch (e) {
      throw Exception('Error fetching now playing movies: $e');
    }
  }

  Future<Movie> getMovieDetail(int movieId) async {
    try {
      final response = await dio.get('${Constants.movieDetail}$movieId');

      if (response.statusCode == 200) {
        final movie = Movie.fromJson(response.data);
        return movie;
      }

      throw Exception('Failed to load movie details');
    } catch (e) {
      throw Exception('Error fetching movie details: $e');
    }
  }

  Future<List<CastMember>> getMovieCredits(int movieId) async {
    try {
      final response = await dio.get('${Constants.movieDetail}$movieId/credits');

      if (response.statusCode == 200 && response.data['cast'] != null) {
        var castList = response.data['cast'] as List;
        return castList.map((json) => CastMember.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Error fetching movie credits: $e');
    }
  }
}
