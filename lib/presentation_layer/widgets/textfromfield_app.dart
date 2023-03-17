import 'package:e_commerce/core/colors_app.dart';
import 'package:e_commerce/core/valiables.dart';
import 'package:flutter/material.dart';

class TextFromFieldOfApp extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Widget? suffixIcon;
  final TextInputType textType;
  final bool obscureText;
  final Function function;
  final TextEditingController controller;

  const TextFromFieldOfApp(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.textType,
      required this.function,
      required this.controller,
        this.obscureText=false,
        this.suffixIcon
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        prefixIcon: Icon(
          icon,
          color: isDark ? ColorsApp.pinkClr : ColorsApp.mainColor,
          size: 30,
        ),
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
      ),
      keyboardType: textType,
      validator: (value) => function(value),
      cursorColor: Colors.black,
      controller: controller,
    );
  }
}
