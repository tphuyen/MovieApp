import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/view/movies/movie_page.dart';
import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/gen/fonts.gen.dart';

import 'package:movie_app/view/ticket/ticket_page.dart';
import 'package:movie_app/view/save/save_page.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MoviesPage(),
    const TicketsPage(),
    const SavedPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.bookmark,
              color: _selectedIndex == 0 ? Colors.amber : null,
            ),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.ticket,
              color: _selectedIndex == 1 ? Colors.amber : null,
            ),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.saveUnclick,
              color: _selectedIndex == 2 ? Colors.amber : null,
            ),
            label: 'Save',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
