import 'package:flutter/material.dart';

// Section header for 'Now Showing' and 'Popular'
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeMore;

  const SectionHeader({super.key, required this.title, required this.onSeeMore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontFamily: 'Merriweather', fontSize: 20, fontWeight: FontWeight.w800),
        ),
        TextButton(
          onPressed: onSeeMore,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: const ShapeDecoration(
                shape: StadiumBorder(
                  side:BorderSide(color: Colors.grey, width: 1),
                )
            ),
            child: const Text(
                'See more',
                style: TextStyle(color: Colors.grey,fontFamily: 'Mulish', fontSize:12)),
          ),
        ),
      ],
    );
  }
}
