import 'package:movie_app/data/remote/api/api_client.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/res/widgets/constants.dart';

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

      if (response.data != null && response.data['results'] != null) {
        var jsonList = response.data['results'];
        if (jsonList is List) {
          return jsonList.map((json) => _safeMovieFromJson(json)).toList();
        }
      }
      throw Exception('No results found or response is null');
    } catch (e) {
      throw Exception('Error fetching popular movies: $e');
    }
  }

  Future<List<Movie>> getPlayingMovies({int page = 1}) async {
    try {
      final response = await dio.request(
        endpoint: Constants.nowPlayingMovies,
        method: DioMethod.get,
        param: {'page': page},
      );

      if (response.data != null && response.data['results'] != null) {
        var jsonList = response.data['results'];
        if (jsonList is List) {
          return jsonList.map((json) => _safeMovieFromJson(json)).toList();
        }
      }
      throw Exception('No results found or response is null');
    } catch (e) {
      throw Exception('Error fetching now playing movies: $e');
    }
  }

  Future<Movie> getMovieDetail(int movieId) async {
    try {
      final response = await dio.request(
        endpoint: '${Constants.movieDetail}$movieId',
        method: DioMethod.get,
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;
        return _safeMovieFromJson(jsonData);
      }
      final movie = Movie.fromJson(response.data);
      print('Parsed runtime: ${movie.runtime}');

      throw Exception('Failed to load movie details');
    } catch (e) {
      throw Exception('Error fetching movie details: $e');
    }
  }

  Future<List<CastMember>> getMovieCredits(int movieId) async {
    try {
      final response = await dio.request(
        endpoint: '${Constants.movieDetail}$movieId/credits',
        method: DioMethod.get,
      );

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
Movie _safeMovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] ?? 0,
    title: json['title'] ?? 'Unknown Title',
    originalTitle: json['original_title'] ?? 'Unknown',
    overview: json['overview'] ?? 'No overview available',
    posterPath: json['poster_path'] ?? '',
    backdropPath: json['backdrop_path'] ?? '',
    mediaType: json['media_type'] ?? 'movie',
    adult: json['adult'] ?? false,
    originalLanguage: json['original_language'] ?? 'en',
    genreIds: (json['genre_ids'] as List?)?.map((e) => e as int).toList() ?? [],
    popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
    releaseDate: json['release_date'] ?? 'Unknown',
    video: json['video'] ?? false,
    voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
    voteCount: json['vote_count'] ?? 0,
    runtime: json['runtime'] ?? 0,
    cast: (json['cast'] as List?)
        ?.map((e) => CastMember.fromJson(e as Map<String, dynamic>))
        .toList() ?? [],
  );
}
