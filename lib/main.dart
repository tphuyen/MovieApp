import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/widgets/movie_card.dart';
import 'package:movie_app/widgets/movie_item.dart';
import 'package:movie_app/widgets/sectionHeader_item.dart';

import 'movie_data.dart';

void main() {
  runApp(const MaterialApp(
    home: MovieHomePage(),
  ));
}

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
          icon: SvgPicture.asset('assets/icons/hamburger_menu.svg'),
        ),
        title: const Text(
          'FilmKu',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
              fontFamily: 'Merriweather', fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/Notif.svg'),
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
              // Now Showing Section
              SectionHeader(title: 'Now Showing', onSeeMore: () {}),
              SizedBox(
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return MoviePoster(
                      imageUrl: movie['imageUrl'],
                      title: movie['title'],
                      rating: movie['rating'],
                    );
                  },
                ),
              ),
              // Popular Section
              SizedBox(height: 6),
              SectionHeader(title: 'Popular', onSeeMore: () {}),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                addAutomaticKeepAlives: false,
                itemCount: movies.length, // Number of movies
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return MovieItem(
                    imageUrl: movie['imageUrl'],
                    title: movie['title'],
                    genre: movie['genre'],
                    duration: movie['duration'],
                    rating: movie['rating'],
                  ); // Replace with MovieItem widget
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
            icon: SvgPicture.asset(
                'assets/icons/Bookmark.svg'),
            label: 'Movies',

          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/ticket.svg'),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/save_unclick.svg'),
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
