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
      body: Consumer<HomeProvider>(
          builder: (context, homeProvider, _) => homeProvider.currentPage),
      bottomNavigationBar: Consumer<HomeProvider>(
          builder: (context, homeProvider, _) => BottomNavigationBar(
                currentIndex: homeProvider.selectedIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icons.bookmark,
                      color:
                          homeProvider.selectedIndex == 0 ? Colors.amber : null,
                    ),
                    label: 'Movies',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icons.ticket,
                      color:
                          homeProvider.selectedIndex == 1 ? Colors.amber : null,
                    ),
                    label: 'Tickets',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icons.saveUnclick,
                      color:
                          homeProvider.selectedIndex == 2 ? Colors.amber : null,
                    ),
                    label: 'Save',
                  ),
                ],
                onTap: (index) {
                  homeProvider.updateIndex(index);
                },
              )),
    );
  }
}
