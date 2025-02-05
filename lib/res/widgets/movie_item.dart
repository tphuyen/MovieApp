import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/gen/fonts.gen.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view/movie_detail_page.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
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
              child: Image.asset(
                movie.posterPath,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
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
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      fontFamily: FontFamily.mulish,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    SvgPicture.asset(Assets.icons.star, width: 16, height: 16),
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
                const SizedBox(height: 6),
                //genre gọi & design
                Wrap(
                  spacing: 8,
                  children: movie.genreNames.map((genre) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFDBE3FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        genre.toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xFF87A3E8),
                          fontFamily: FontFamily.mulish,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.16,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 6),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.icons.clock,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movie.runtime != null ? '${movie.runtime} min' : 'N/A',
                      style: const TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
