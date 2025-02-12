import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/res/widgets/movie_card.dart';
import 'package:movie_app/res/widgets/movie_item.dart';
import 'package:movie_app/res/widgets/section_header_item.dart';
import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/gen/fonts.gen.dart';
import 'package:movie_app/viewmodel/home_view_model.dart';
import 'package:movie_app/viewmodel/movie_view_model.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, bool>(
      selector: (_, provider) => provider.isConnected,
      builder: (context, isConnected, child) {
        if (isConnected) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final movieViewModel = Provider.of<MovieViewModel>(context, listen: false);
            movieViewModel.fetchMovies();
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _showNoConnectionDialog(context);
          });
        }

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
          body: Selector<MovieViewModel, bool>(
            selector: (_, provider) => provider.isLoading,
            builder: (context, isLoading, _) {
              if (isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Consumer<MovieViewModel>(
                builder: (context, movieProvider, _) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionHeader(title: 'Now Showing', onSeeMore: () {}),
                          SizedBox(
                            height: 270,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movieProvider.nowPlayingMovies.length,
                              itemBuilder: (context, index) {
                                final movie = movieProvider.nowPlayingMovies[index];
                                return MoviePoster(movie: movie);
                              },
                            ),
                          ),
                          const SizedBox(height: 6),
                          SectionHeader(title: 'Popular', onSeeMore: () {}),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: movieProvider.popularMovies.length,
                            itemBuilder: (context, index) {
                              final movie = movieProvider.popularMovies[index];
                              return MovieItem(movie: movie);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  /// Hiển thị hộp thoại cảnh báo mất kết nối
  void _showNoConnectionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Mất kết nối'),
        content: const Text('Không có kết nối mạng, làm ơn kiểm tra lại.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

