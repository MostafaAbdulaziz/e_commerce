import 'package:e_commerce/core/routes/routes_screens.dart';
import 'package:e_commerce/presentation_layer/screens/signup_screen.dart';
import 'package:e_commerce/presentation_layer/widgets/decoratoin_of_container.dart';
import 'package:e_commerce/presentation_layer/widgets/material_button_app.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:e_commerce/presentation_layer/widgets/textbutton_of_app.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage('assets/images/background.png'),
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 200,
                  height: 70,
                  decoration: decoration(color: Colors.black.withOpacity(0.5)),
                  child: const Center(
                    child: TextApp(text: 'Welcome'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 240,
                  height: 70,
                  decoration: decoration(color: Colors.black.withOpacity(0.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextApp(color: Colors.teal, text: 'MoApp'),
                       SizedBox(
                        width: 5,
                      ),
                      TextApp(text: 'Shop'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 180,
                ),
                MaterialButtonApp(
                    text: 'Get Start',
                    function: () {
                      routeScreen(context: context, screen: const LoginScreen());
                    },),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextApp(text: 'Don\'t have an Account ?', font: 15),
                    TextButtonApp(
                        text: 'SignUp',
                        function: (){
                          routeScreen(context: context, screen: const SignUpScreen());
                        }
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
