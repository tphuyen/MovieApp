import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Selector<HomeProvider, Widget>(
        selector: (_, homeProvider) => homeProvider.currentPage,
        builder: (context, currentPage, _) => currentPage,
      ),
      bottomNavigationBar: Selector<HomeProvider, int>(
          selector: (_, homeProvider) => homeProvider.selectedIndex,

          builder: (context, selectedIndex, _) =>
              BottomNavigationBar(
                currentIndex: selectedIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icons.bookmark,
                      color:
                      selectedIndex == 0 ? Colors.amber : null,
                    ),
                    label: 'Movies',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icons.ticket,
                      color:
                      selectedIndex == 1 ? Colors.amber : null,
                    ),
                    label: 'Tickets',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icons.saveUnclick,
                      color:
                      selectedIndex == 2 ? Colors.amber : null,
                    ),
                    label: 'Save',
                  ),
                ],
                onTap: (index) {
                  context.read<HomeProvider>().updateIndex(index);
                },
              )),
    );
  }
}
