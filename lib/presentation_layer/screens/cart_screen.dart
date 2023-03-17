import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:flutter/material.dart';

import 'cart_contain_of_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextApp(text: 'Cart items', font: 20),
        actions: [IconButton(onPressed: () {}, icon:const  Icon(Icons.backspace))],
      ),
      body: const CartOfItems()
    );
  }
}
