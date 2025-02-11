import 'package:flutter/material.dart';

import 'package:movie_app/gen/fonts.gen.dart';
import 'package:movie_app/model/cast.dart';

import 'package:movie_app/res/widgets/constants.dart';

class CastCard extends StatelessWidget{
  final CastMember castMember;

  const CastCard({super.key,
    required this.castMember});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: castMember.profilePath != null
                ? Image.network(
              '${Constants.imgPath}${castMember.profilePath}',
              width: 90,
              height: 100,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  width: 90,
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 90,
                  height: 100,
                  color: Colors.grey[300],
                  child: const Icon(Icons.person),
                );
              },
            )
                : Container(
              width: 90,
              height: 100,
              color: Colors.grey[300],
              child: const Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            castMember.name,
            style: const TextStyle(
              fontFamily: FontFamily.mulish,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

}