import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';

class MoviePoster extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;

  const MoviePoster({
    required this.imageUrl,
    required this.title,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 270,
      padding: const EdgeInsets.fromLTRB(8,0,7,0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: 150,
              height: 190,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          // Movie Title
          Text(
            title,
            style: const TextStyle(
              fontFamily: FontFamily.mulish,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          // Rating
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                '$rating/10 IMDb',
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
