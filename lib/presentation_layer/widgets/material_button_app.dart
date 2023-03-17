import 'package:e_commerce/core/colors_app.dart';
import 'package:e_commerce/core/valiables.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:flutter/material.dart';

class MaterialButtonApp extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Function() function;
  final double font;

  const MaterialButtonApp(
      {Key? key,
      this.height = 45.0,
      this.width = 170.0,
      required this.text,
      required this.function,
      this.font = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: width,
      color: isDark ? ColorsApp.pinkClr : ColorsApp.mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: function,
      child: TextApp(text: text, font: font),
    );
  }
}
