import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final double iconSize;
  final TextStyle? textStyle;

  const RatingWidget({
    super.key,
    required this.rating,
    this.iconSize = 16,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star, // Icon star cố định
          color: Colors.amber, // Màu vàng
          size: iconSize,
        ),
        const SizedBox(width: 4), // Khoảng cách giữa icon và text
        Text(
          '$rating/10 IMDb', // Điểm đánh giá hiển thị
          style: textStyle ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
