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

  static final List<Widget> pages = [
    const MoviesPage(),
    const TicketsPage(),
    const SavedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Selector<HomeViewModel, int>(
        selector: (_, homeViewModel) => homeViewModel.selectedIndex,
        builder: (context, selectedIndex, child) {
          return IndexedStack(
            index: selectedIndex,
            children: pages,
          );
        },
      ),
      bottomNavigationBar: Selector<HomeViewModel, int>(
        selector: (_, homeViewModel) => homeViewModel.selectedIndex,
        builder: (context, selectedIndex, child) {
          return BottomNavigationBar(
            currentIndex: selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.bookmark,
                  color: selectedIndex == 0 ? Colors.amber : null,
                ),
                label: 'Movies',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.ticket,
                  color: selectedIndex == 1 ? Colors.amber : null,
                ),
                label: 'Tickets',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.saveUnclick,
                  color: selectedIndex == 2 ? Colors.amber : null,
                ),
                label: 'Save',
              ),
            ],
            onTap: (index) => context.read<HomeViewModel>().updateIndex(index),
          );
        },
      ),
    );
  }
}
