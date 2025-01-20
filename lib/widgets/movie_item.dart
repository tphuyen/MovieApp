import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final List<String> genre;
  final String duration;

  const MovieItem({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.genre,
    required this.duration,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/Star.svg', width: 16, height: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$rating/10 IMDb',
                      style: const TextStyle(
                          fontFamily: 'Mulish', fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                //genre gọi & design
                Wrap(
                  spacing: 8,
                  children: genre.map((g) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                          fontFamily: 'Mulish', fontSize: 10,
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
                      'assets/icons/clock.svg',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      duration,
                      style: const TextStyle(
                          fontFamily: 'Mulish', fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87
                      ),
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
