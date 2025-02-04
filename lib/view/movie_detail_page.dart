import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/res/widgets/section_header_item.dart';

import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/gen/fonts.gen.dart';
import 'package:movie_app/model/movie.dart';

import 'package:movie_app/res/widgets/cast_card.dart';

import 'package:movie_app/viewmodel/save_movie_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Image.asset(
                    movie.filmBgTrailer,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Opacity(
                    opacity: 0.25,
                    child: Container(
                      width: double.infinity,
                      height: 320,
                      decoration: const BoxDecoration(color: Color(0xFF110E47)),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 30,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(Assets.icons.back,
                              width: 30, height: 30),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        IconButton(
                          icon: SvgPicture.asset(Assets.icons.menu,
                              width: 20, height: 20),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    )
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            Assets.icons.playVid,
                            width: 40,
                            height: 40,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Play Trailer',
                          style: TextStyle(
                            fontFamily: FontFamily.mulish,
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontFamily: FontFamily.mulish,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: SvgPicture.asset(
                              Assets.icons.saveClick,
                              color: context.watch<SavedMovieProvider>().isSaved(movie)
                                  ? Colors.amber
                                  : Colors.grey,
                              width: 30,
                              height: 30,
                            ),
                            onPressed: () {
                              context.read<SavedMovieProvider>().toggleSave(movie);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icons.star, width: 16, height: 16),
                          const SizedBox(width: 4),
                          Text(
                            '${movie.rating}/10 IMDb',
                            style: const TextStyle(
                                fontFamily: FontFamily.mulish,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 8,
                        children: movie.genre.map((genre) {
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
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text('Length', style: TextStyle(fontFamily: 'Mulish',
                                  fontSize: 16, color: Colors.grey)),
                              Text(
                                movie.duration,
                                style: const TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Language', style: TextStyle(fontFamily: 'Mulish',
                                  fontSize: 16, color: Colors.grey)),
                              Text(
                                movie.language,
                                style: const TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Age', style: TextStyle(fontFamily: 'Mulish',
                                  fontSize: 16, color: Colors.grey)),
                              Text(
                                movie.age,
                                style: const TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      const SectionHeader(title: 'Description'),
                      const SizedBox(height: 10),
                      Text(
                        movie.description,
                        style: const TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SectionHeader(title: 'Cast', onSeeMore: () {}),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movie.cast.length,
                          itemBuilder: (context, index) {
                            final castMember = movie.cast[index];
                            return CastCard(castMember: castMember);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            )
          ],
        )
      ),
    );
  }
}
