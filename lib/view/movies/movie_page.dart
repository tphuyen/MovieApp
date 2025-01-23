import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/view/movies/widget/movie_card.dart';
import 'package:movie_app/view/movies/widget/movie_item.dart';
import 'package:movie_app/view/movies/widget/section_header_item.dart';

import 'package:movie_app/data/mock/mock_movie_data.dart';

import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/gen/fonts.gen.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return MoviePoster(movie: movie);
                  },
                ),
              ),
              const SizedBox(height: 6),
              SectionHeader(title: 'Popular', onSeeMore: () {}),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
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