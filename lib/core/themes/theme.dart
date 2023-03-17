import 'package:e_commerce/core/colors_app.dart';
import 'package:flutter/material.dart';

class ThemesApp {
  static final light = ThemeData(
    primaryColor: ColorsApp.mainColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: ColorsApp.darkGreyClr,
    backgroundColor: ColorsApp.darkGreyClr,
    brightness: Brightness.dark,
  );
}
