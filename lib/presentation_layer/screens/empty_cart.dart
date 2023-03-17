import 'package:e_commerce/core/colors_app.dart';
import 'package:e_commerce/presentation_layer/widgets/material_button_app.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:flutter/material.dart';
import '../../core/valiables.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 135,
            color: isDark ? Colors.white : ColorsApp.darkGreyClr,
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextApp(
                  text: 'Your Cart is ',
                  color: isDark ? Colors.white : ColorsApp.darkGreyClr,
                  font: 22),
              TextApp(text: 'Empty ', color: isDark?ColorsApp.pinkClr:ColorsApp.mainColor, font: 22),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextApp(
              text: 'Add Items to get Started ',
              color: isDark?Colors.white:ColorsApp.darkGreyClr.withOpacity(0.7),
              font: 12),
          const SizedBox(
            height: 40,
          ),
          MaterialButtonApp(
              text: 'Go to Home', function: () {}, width: 100, font: 15)
        ],
      ),
    );
  }
}
