import 'package:flutter/material.dart';

import 'package:movie_app/gen/fonts.gen.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view/movie_detail_page.dart';

class MoviePoster extends StatelessWidget {
  final Movie movie;

  const MoviePoster({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 270,
      padding: const EdgeInsets.fromLTRB(8, 0, 7, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(movie: movie),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                width: 150,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          InkWell(
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
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                '${movie.voteAverage}/10 IMDb',
                style: const TextStyle(
                    fontFamily: FontFamily.mulish,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
