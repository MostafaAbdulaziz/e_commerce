import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:e_commerce/presentation_layer/widgets/textbutton_of_app.dart';
import 'package:flutter/material.dart';

import '../../core/colors_app.dart';
import '../../core/valiables.dart';

class BottomContainerScreens extends StatelessWidget {
  final String textOfContainer;
  final String textOfTextButton;
  final Function() function;

  const BottomContainerScreens(
      {Key? key,
      this.textOfContainer='',
      this.textOfTextButton='',
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: isDark ? ColorsApp.pinkClr : ColorsApp.mainColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextApp(text: textOfContainer, font: 15),
          TextButtonApp(
              text: textOfTextButton,
              function: function,
              underLine: TextDecoration.underline)
        ],
      ),
    );
  }
}
