import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/presentation/blocs/home/home_bloc.dart';
import 'package:movie_app/presentation/blocs/home/home_state.dart';
import 'package:movie_app/presentation/blocs/movie/movie_bloc.dart';
import 'package:movie_app/presentation/blocs/movie/movie_event.dart';
import 'package:movie_app/presentation/blocs/movie/movie_state.dart';
import 'package:movie_app/presentation/widgets/movie_card.dart';
import 'package:movie_app/presentation/widgets/movie_item.dart';
import 'package:movie_app/presentation/widgets/section_header_item.dart';
import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/gen/fonts.gen.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, homeState) {
        if (homeState.isConnected) {
          context.read<MovieBloc>().add(FetchMovies());
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
          body: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.errorMessage != null) {
                return Center(child: Text(state.errorMessage!));
              }
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
                          itemCount: state.nowPlayingMovies.length,
                          itemBuilder: (context, index) {
                            final movie = state.nowPlayingMovies[index];
                            return MoviePoster(movie: movie);
                          },
                        ),
                      ),
                      const SizedBox(height: 6),
                      SectionHeader(title: 'Popular', onSeeMore: () {}),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.popularMovies.length,
                        itemBuilder: (context, index) {
                          final movie = state.popularMovies[index];
                          return MovieItem(movie: movie);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

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

