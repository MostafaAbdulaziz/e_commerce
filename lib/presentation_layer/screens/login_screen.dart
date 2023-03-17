import 'package:e_commerce/core/colors_app.dart';
import 'package:e_commerce/core/routes/routes_screens.dart';
import 'package:e_commerce/core/valiables.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/login_cubit/login_cubit.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/login_cubit/login_states.dart';
import 'package:e_commerce/presentation_layer/screens/forget_password_screen.dart';
import 'package:e_commerce/presentation_layer/screens/main_screen.dart';
import 'package:e_commerce/presentation_layer/widgets/botton_container_screens.dart';
import 'package:e_commerce/presentation_layer/widgets/material_button_app.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:e_commerce/presentation_layer/widgets/textbutton_of_app.dart';
import 'package:e_commerce/presentation_layer/widgets/textfromfield_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'signup_screen.dart';

var formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {

        },
        builder: (context, state) => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 90),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextApp(
                                  text: 'LOG',
                                  color:  isDark?ColorsApp.pinkClr:ColorsApp.mainColor,
                                  font: 40),
                              const SizedBox(
                                width: 5,
                              ),
                              TextApp(
                                  text: 'IN',
                                  color: isDark?Colors.white:ColorsApp.darkGreyClr)
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          TextFromFieldOfApp(
                              hintText: 'Email',
                              icon: Icons.email,
                              textType: TextInputType.emailAddress,
                              function: (value) {
                                if (value.toString().isEmpty) {
                                  return 'please enter your mail';
                                }
                                return null;
                              },
                              controller: emailLoginController),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFromFieldOfApp(
                              hintText: 'Password',
                              icon: Icons.lock,
                              textType: TextInputType.visiblePassword,
                              obscureText: LoginCubit.get(context).isNotVisible,
                              controller: passwordLoginController,
                              function: (value) {
                                if (value.toString().isEmpty) {
                                  return 'please enter your password';
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    LoginCubit.get(context).changeIconOfPassword();
                                  },
                                  icon: Icon(
                                    LoginCubit.get(context).iconPassword,
                                    size: 30,
                                    color: isDark?ColorsApp.pinkClr:ColorsApp.mainColor,
                                  ))),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButtonApp(
                                  text: 'Forgot Password',
                                  color:  isDark?Colors.white:ColorsApp.darkGreyClr,
                                  function: () {
                                    routeScreen(
                                        context: context,
                                        screen: const ForgetPasswordScreen());
                                  }),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              // checkContainer(
                              //     function: () {
                              //       LoginCubit.get(context).checkConditions();
                              //     },
                              //     context: context,
                              //     icon: LoginCubit.get(context)
                              //         .checkIconConditions),
                              const SizedBox(
                                width: 5,
                              ),
                              TextApp(
                                  text: 'Remember me',
                                  color: isDark?Colors.white:ColorsApp.darkGreyClr,
                                  font: 16)
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          state is LoginWithEmAndPassLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : MaterialButtonApp(
                                  text: 'LOG IN',
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context)
                                          .loginWithEmailAndPassword(
                                              email: emailLoginController.text,
                                              password:
                                                  passwordLoginController.text,
                                              context: context);
                                    }
                                  },
                                  width: double.infinity),
                          const SizedBox(
                            height: 20,
                          ),
                          TextApp(
                              text: 'OR',
                              color: isDark? Colors.white:ColorsApp.darkGreyClr,
                              font: 16),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    'assets/images/google.png',
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                onTap: () {
                                  LoginCubit.get(context)
                                      .loginUsingGoogle()
                                      .then((value) {
                                    Fluttertoast.showToast(
                                        msg: 'Login success',
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    pushAndRemove(context, const MainScreen());
                                  }).catchError((error) {
                                    print(error);
                                    Fluttertoast.showToast(
                                        msg: error.toString(),
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    'assets/images/facebook.png',
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                onTap: () {
                                  LoginCubit.get(context)
                                      .signInWithFacebook()
                                      .then((value) {
                                    Fluttertoast.showToast(
                                        msg: 'Login success',
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    pushAndRemove(context, const MainScreen());
                                  }).catchError((error) {
                                    print(error.toString());
                                    Fluttertoast.showToast(
                                        msg: error.toString(),
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  BottomContainerScreens(
                      textOfContainer: 'Don\'t have an Account ?',
                      textOfTextButton: 'SignUp',
                      function: () {
                        routeScreen(context: context, screen: const SignUpScreen());
                      })
                ],
              ),
            ),
          ),
          //backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        ),
      ),
    );
  }
}
