import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final double iconSize;
  final TextStyle? textStyle;

  const RatingWidget({
    super.key,
    required this.rating,
    this.iconSize = 16,
    this.textStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: iconSize,
        ),
        const SizedBox(width: 4),
        Text(
          '$rating/10 IMDb',
          style: textStyle,
        ),
      ],
    );
  }
}
