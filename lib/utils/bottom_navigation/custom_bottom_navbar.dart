import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/presentation/blocs/home/home_bloc.dart';
import 'package:movie_app/presentation/blocs/home/home_event.dart';
import 'package:movie_app/presentation/blocs/home/home_state.dart';
import 'package:movie_app/presentation/screens/movie_page.dart';
import 'package:movie_app/presentation/screens/save_page.dart';
import 'package:movie_app/presentation/screens/ticket_page.dart';

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
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.selectedIndex != current.selectedIndex,
        builder: (context, state) {
          return IndexedStack(
            index: state.selectedIndex,
            children: pages,
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.selectedIndex != current.selectedIndex,
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.bookmark,
                  color: state.selectedIndex == 0 ? Colors.amber : null,
                ),
                label: 'Movies',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.ticket,
                  color: state.selectedIndex == 1 ? Colors.amber : null,
                ),
                label: 'Tickets',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.saveUnclick,
                  color: state.selectedIndex == 2 ? Colors.amber : null,
                ),
                label: 'Save',
              ),
            ],
            onTap: (index) => context.read<HomeBloc>().add(UpdateIndex(index)),
          );
        },
      ),
    );
  }
}
