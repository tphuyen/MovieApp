import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/presentation/blocs/saved_movie/saved_movie_bloc.dart';
import 'package:movie_app/presentation/blocs/saved_movie/saved_movie_event.dart';
import 'package:movie_app/presentation/blocs/saved_movie/saved_movie_state.dart';
import 'package:movie_app/gen/fonts.gen.dart';
import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/presentation/screens/movie_detail_page.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.8,
        title: const Text(
          'Saved Movies',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.merriweather,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<SavedMovieBloc, SavedMovieState>(
        buildWhen: (previous, current) {
          return previous is! SavedMovieLoaded ||
              (current is SavedMovieLoaded && previous.savedMovies != current.savedMovies);
        },
        builder: (context, state) {
          if (state is SavedMovieLoaded && state.savedMovies.isNotEmpty) {
            return ListView.builder(
              itemCount: state.savedMovies.length,
              itemBuilder: (context, index) {
                final movie = state.savedMovies[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      width: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: double.infinity,
                        height: 320,
                        color: Colors.grey[300],
                      ),
                    ),
                    title: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailPage(movie: movie),
                          ),
                        );
                      },
                      child: Text(
                        movie.title,
                        style: const TextStyle(
                          fontFamily: FontFamily.mulish,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        SvgPicture.asset(Assets.icons.star,
                            width: 16, height: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${movie.voteAverage}/10 IMDb',
                          style: const TextStyle(
                              fontFamily: FontFamily.mulish,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirm Delete',
                                  style: TextStyle(
                                    fontFamily: FontFamily.mulish,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  )),
                              content: Text(
                                  'Are you sure to delete movie ${movie.title}?',
                                  style: const TextStyle(
                                    fontFamily: FontFamily.mulish,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  )),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel',
                                      style: TextStyle(
                                        fontFamily: FontFamily.mulish,
                                        fontSize: 16,
                                      )),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<SavedMovieBloc>().add(ToggleSaveMovie(movie));
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('${movie.title} removed from saved!')),
                                    );
                                  },
                                  child: const Text('Delete',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontFamily: FontFamily.mulish,
                                        fontSize: 16,
                                      )),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'No movies saved yet!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
        },
      ),
    );
  }
}
