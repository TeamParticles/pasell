import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;

  const CustomText(
      {@required this.text,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.textOverflow = TextOverflow.visible});

  @override
  Widget build(BuildContext context) {}
}
