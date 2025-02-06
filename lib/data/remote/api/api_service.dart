import 'package:movie_app/data/remote/api/api_client.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/res/widgets/constants.dart';
import 'package:movie_app/model/cast.dart';

class ApiService {
  final ApiClient dio;

  ApiService(this.dio);

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    try {
      final response = await dio.request(
        endpoint: Constants.popularMovies,
        method: DioMethod.get,
        param: {'page': page},
      );

      print('Popular Movies Response Data: ${response.data}');

      if (response.data != null && response.data['results'] != null) {
        var jsonList = response.data['results'];

        if (jsonList is List) {
          return jsonList.map((json) {
            Movie movie = Movie.fromJson(json);

            if (movie.title == null) {
              print('Movie title is null');
            }
            if (movie.posterPath == null) {
              print('Movie posterPath is null');
            }
            if (movie.runtime == null) {
              print('Movie runtime is null');
            }
            if (movie.cast == null || movie.cast!.isEmpty) {
              print('Movie cast is null or empty');
            }

            return movie;
          }).toList();
        } else {
          throw Exception('Expected results to be a List but got: $jsonList');
        }
      } else {
        throw Exception('No results found in the response or response is null');
      }
    } catch (e) {
      print('Error occurred while fetching popular movies: $e');
      throw Exception('Network error occurred: $e');
    }
  }


  Future<List<Movie>> getPlayingMovies({int page = 1}) async {
    try {
      final response = await dio.request(
        endpoint: Constants.nowPlayingMovies,
        method: DioMethod.get,
        param: {'page': page},
      );

      print('Now Playing Movies Response Data: ${response.data}');

      if (response.data != null && response.data['results'] != null) {
        var jsonList = response.data['results'];

        if (jsonList is List) {
          return jsonList.map((json) => Movie.fromJson(json)).toList();
        } else {
          throw Exception('Expected results to be a List but got: $jsonList');
        }
      } else {
        throw Exception('No results found in the response or response is null');
      }
    } catch (e) {
      print('Error occurred while fetching now playing movies: $e');
      throw Exception('Network error occurred: $e');
    }
  }

  Future<Movie> getMovieDetail(Movie movie) async {
    try {
      final response = await dio.request(
        endpoint: '${Constants.movieDetail}${movie.id}',
        method: DioMethod.get,
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;
        movie.runtime = jsonData['runtime'];
        return movie;
      } else {
        throw Exception('Failed to load movie details');
      }
    } catch (e) {
      print('Error occurred while fetching movie details: $e');
      throw Exception('Failed to load movie details: $e');
    }
  }

  Future<Movie> getMovieCredits(Movie movie) async {
    try {
      final response = await dio.request(
        endpoint: '${Constants.movieDetail}${movie.id}/credits',
        method: DioMethod.get,
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;

        if (jsonData['cast'] != null) {
          movie.cast = (jsonData['cast'] as List).map((castJson) {
            return CastMember.fromJson(castJson);
          }).toList();
        } else {
          movie.cast = [];
        }
      } else {
        throw Exception('Failed to load movie cast');
      }

      return movie;
    } catch (e) {
      print('Error occurred while fetching movie credits: $e');
      throw Exception('Failed to load movie cast: $e');
    }
  }

}
