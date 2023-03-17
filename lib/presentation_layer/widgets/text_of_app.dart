import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  final double font;
  final Color color;
  final String text;
  final TextDecoration? textDecoration;
  final double? decorationThickness;
  final double? height;
  final FontWeight fontWeight;
  final int maxLine;

  const TextApp({super.key,
    this.font = 30,
    this.color = Colors.white,
    required this.text,
    this.textDecoration,
    this.decorationThickness,
    this.height,
    this.fontWeight = FontWeight.bold,
    this.maxLine = 1
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: font,
          fontWeight: fontWeight,
          color: color,
          decoration: textDecoration,
          decorationThickness: decorationThickness,
          height: height
      ),
      textAlign: TextAlign.start,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
