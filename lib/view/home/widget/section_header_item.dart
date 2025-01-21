import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeMore;

  const SectionHeader({super.key, required this.title, this.onSeeMore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontFamily: FontFamily.merriweather,
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
        TextButton(
          onPressed: onSeeMore,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: const ShapeDecoration(
                shape: StadiumBorder(
              side: BorderSide(color: Colors.grey, width: 1),
            )),
            child: const Text('See more',
                style: TextStyle(
                    color: Colors.grey, fontFamily: FontFamily.mulish, fontSize: 12)),
          ),
        ),
      ],
    );
  }
}
