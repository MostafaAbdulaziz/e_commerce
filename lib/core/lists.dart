import 'package:flutter/material.dart';
import '../presentation_layer/screens/category_screen.dart';
import '../presentation_layer/screens/favorites_screen.dart';
import '../presentation_layer/screens/home_screen.dart';
import '../presentation_layer/screens/setting_screen.dart';

List<String> nameScreens = ['Home', 'Categories', 'Favorite', 'Setting'];
List<Widget> screens = [
  const HomeScreen(),
  const CategoryScreen(),
  const FavoriteScreen(),
  const SettingScreen()
];
List<dynamic> products=[];
List<dynamic> favouriteProducts=[];
