import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const SmallText({
    super.key,
    required this.text,
    required this.size,
required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        // fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}
