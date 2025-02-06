import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/res/widgets/movie_card.dart';
import 'package:movie_app/res/widgets/movie_item.dart';
import 'package:movie_app/res/widgets/section_header_item.dart';
import 'package:movie_app/data/remote/api/api_service.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/gen/fonts.gen.dart';

import 'package:movie_app/data/remote/api/api_client.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final ApiService _apiService = ApiService(ApiClient());

  List<Movie> _nowPlayingMovies = [];
  List<Movie> _popularMovies = [];

  bool _isLoadingNowPlaying = true;
  bool _isLoadingPopular = true;

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    try {
      final nowPlayingMovies = await _apiService.getPlayingMovies();
      final popularMovies = await _apiService.getPopularMovies();

      setState(() {
        _nowPlayingMovies = nowPlayingMovies;
        _popularMovies = popularMovies;
        _isLoadingNowPlaying = false;
        _isLoadingPopular = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoadingNowPlaying = false;
        _isLoadingPopular = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.8,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.icons.hamburgerMenu),
        ),
        title: const Text(
          'FilmKu',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.merriweather,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.icons.notif),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: 'Now Showing', onSeeMore: () {}),
              SizedBox(
                height: 270,
                child: _isLoadingNowPlaying
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _nowPlayingMovies.length,
                        itemBuilder: (context, index) {
                          final movie = _nowPlayingMovies[index];
                          return MoviePoster(movie: movie);
                        },
                      ),
              ),
              const SizedBox(height: 6),
              SectionHeader(title: 'Popular', onSeeMore: () {}),
              _isLoadingPopular
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _popularMovies.length,
                      itemBuilder: (context, index) {
                        final movie = _popularMovies[index];
                        return MovieItem(movie: movie);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
