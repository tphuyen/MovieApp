import 'package:flutter/material.dart';

import 'package:movie_app/gen/fonts.gen.dart';
import 'package:movie_app/model/cast.dart';

class CastCard extends StatelessWidget{
  final CastMember castMember;

  const CastCard({super.key,
    required this.castMember});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Adjust width to fit multiple cards in a row
      padding: const EdgeInsets.symmetric(horizontal: 4), // Reduce padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center the content
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              castMember.imageUrl,
              width: 90,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            castMember.name,
            style: const TextStyle(
              fontFamily: FontFamily.mulish,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

}