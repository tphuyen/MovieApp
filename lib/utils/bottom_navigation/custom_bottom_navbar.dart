import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/view/movie_page.dart';
import 'package:movie_app/view/ticket_page.dart';
import 'package:movie_app/view/save_page.dart';
import 'package:movie_app/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();

    final List<Widget> pages = [
      const MoviesPage(),
      const TicketsPage(),
      const SavedPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: homeViewModel.selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeViewModel.selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.bookmark,
              color: homeViewModel.selectedIndex == 0 ? Colors.amber : null,
            ),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.ticket,
              color: homeViewModel.selectedIndex == 1 ? Colors.amber : null,
            ),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.saveUnclick,
              color: homeViewModel.selectedIndex == 2 ? Colors.amber : null,
            ),
            label: 'Save',
          ),
        ],
        onTap: (index) => homeViewModel.updateIndex(index),
      ),
    );
  }
}
