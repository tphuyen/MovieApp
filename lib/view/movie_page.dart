import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/res/widgets/movie_card.dart';
import 'package:movie_app/res/widgets/movie_item.dart';
import 'package:movie_app/res/widgets/section_header_item.dart';
import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/gen/fonts.gen.dart';

import 'package:movie_app/viewmodel/movie_view_model.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieViewModel = Provider.of<MovieProvider>(context);

    Future.microtask(() => movieViewModel.fetchMovies());
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
                child: movieViewModel.isLoadingNowPlaying
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movieViewModel.nowPlayingMovies.length,
                        itemBuilder: (context, index) {
                          final movie = movieViewModel.nowPlayingMovies[index];
                          return MoviePoster(movie: movie);
                        },
                      ),
              ),
              const SizedBox(height: 6),
              SectionHeader(title: 'Popular', onSeeMore: () {}),
              movieViewModel.isLoadingPopular
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: movieViewModel.popularMovies.length,
                      itemBuilder: (context, index) {
                        final movie = movieViewModel.popularMovies[index];
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
