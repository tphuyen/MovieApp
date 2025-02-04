import 'package:flutter/material.dart';
import 'package:movie_app/view/movie_page.dart';
import 'package:movie_app/view/ticket_page.dart';
import 'package:movie_app/view/save_page.dart';

class HomeProvider extends ChangeNotifier {
  final List<Widget> _pages = [
    const MoviesPage(),
    const TicketsPage(),
    const SavedPage(),
  ];
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  Widget get currentPage => _pages[_selectedIndex];

  void updateIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}
