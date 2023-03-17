import 'package:badges/badges.dart';
import 'package:e_commerce/core/colors_app.dart';
import 'package:e_commerce/core/routes/routes_screens.dart';
import 'package:e_commerce/core/valiables.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/main_cubit/main_cubit.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/main_cubit/main_states.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/lists.dart';
import 'cart_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: TextApp(
                text: nameScreens[MainCubit.get(context).currentIndex],
                font: 20,
              color: isDark?Colors.white:ColorsApp.darkGreyClr
            ),
            centerTitle: true,
            actions: [
              Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent:const  Text(
                  '10',
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  onPressed: () {
                    routeScreen(context: context, screen: const CartScreen());
                  },
                  icon:  Icon(Icons.shop,color: isDark?Colors.white:ColorsApp.darkGreyClr),
                ),
              )

            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            //selected items
            selectedFontSize: 17,
            selectedItemColor: isDark?ColorsApp.pinkClr:ColorsApp.mainColor,
            selectedIconTheme: const IconThemeData(size: 30),

            //unselected items
            unselectedFontSize: 14,
            unselectedItemColor: isDark?Colors.white:ColorsApp.darkGreyClr,
            unselectedIconTheme: const IconThemeData(size: 20),

            //other data about botNavBar
            currentIndex: MainCubit.get(context).currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: isDark?ColorsApp.darkGreyClr:Colors.white,
            onTap: (int index) {
              MainCubit.get(context).navBetweenScreen(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
              ),
            ],
          ),
          body: screens[MainCubit.get(context).currentIndex],
        );
      },
    );
  }
}
