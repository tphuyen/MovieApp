import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/view/home/widget/movie_card.dart';
import 'package:movie_app/view/home/widget/movie_item.dart';
import 'package:movie_app/view/home/widget/section_header_item.dart';

import '../../data/mock/mock_movie_data.dart';
import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../model/movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light, // Màu của thanh trạng thái đổi thành trắng
        child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(
                Assets.images.filmBgTrailer.path,
                width: MediaQuery.of(context).size.width,
                height: 320,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Opacity(
                opacity: 0.25,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 320,
                  decoration: const BoxDecoration(color: Color(0xFF110E47)),
                ),
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
                  // const SizedBox(width: 10),
                  IconButton(
                    icon: SvgPicture.asset(Assets.icons.menu,
                        width: 20, height: 20),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Positioned(
              top: 140,
              left: MediaQuery.of(context).size.width / 2 - 30,
              child: Column(
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
            ),
            // Thông tin chi tiết
            Positioned(
              top: 270,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(22),
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
                            width: 30,
                            height: 30,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
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
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      children: movie.genre.map((g) {
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
                            g.toUpperCase(),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        const Column(
                          children: [
                            Text('Language', style: TextStyle(fontFamily: 'Mulish',
                                fontSize: 16, color: Colors.grey)),
                            Text(
                              'English',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87
                              ),
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            Text('Rating', style: TextStyle(fontFamily: 'Mulish',
                                fontSize: 16, color: Colors.grey)),
                            Text(
                              'PG-13',
                              style: TextStyle(
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
                    const SectionHeader(title: 'Description', onSeeMore: null),
                    const SizedBox(height: 22),
                    SectionHeader(title: 'Cast', onSeeMore: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
