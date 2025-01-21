import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/view/home/widget/movie_card.dart';
import 'package:movie_app/view/home/widget/movie_item.dart';
import 'package:movie_app/view/home/widget/section_header_item.dart';

import '../../data/mock/mock_movie_data.dart';
import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
              fontSize: 22),
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
                addAutomaticKeepAlives: false,
                itemCount: movies.length,
                // Number of movies
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return MovieItem(movie: movie);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.bookmark),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.ticket),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.saveUnclick),
            label: 'Save',
          ),
        ],
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
