import 'package:flutter/material.dart';

import 'text_of_app.dart';

class TextButtonApp extends StatelessWidget {
  final String text;
  final Color color;
  final TextDecoration? underLine;
  final Function() function;

  const TextButtonApp(
      {Key? key,
      required this.text,
      this.color = Colors.white,
      this.underLine,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: TextApp(
          text: text,
          font: 15,
          decorationThickness: 3,
          textDecoration: underLine,
          color: color),
    );
  }
}
