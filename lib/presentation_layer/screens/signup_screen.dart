import 'package:e_commerce/core/colors_app.dart';
import 'package:e_commerce/core/routes/routes_screens.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/SignUp_cubit/signup_cubit.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/SignUp_cubit/signup_states.dart';
import 'package:e_commerce/presentation_layer/widgets/botton_container_screens.dart';
import 'package:e_commerce/presentation_layer/widgets/material_button_app.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:e_commerce/presentation_layer/widgets/textbutton_of_app.dart';
import 'package:e_commerce/presentation_layer/widgets/textfromfield_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/valiables.dart';
import 'login_screen.dart';

var formKey = GlobalKey<FormState>();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 100),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextApp(
                                  text: 'SIGN',
                                  color:isDark?ColorsApp.pinkClr:ColorsApp.mainColor,
                                  font: 35),
                              const SizedBox(
                                width: 5,
                              ),
                              TextApp(
                                  text: 'UP',
                                  font: 35,
                                  color: isDark?Colors.white:ColorsApp.darkGreyClr
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          TextFromFieldOfApp(
                              hintText: 'User Name',
                              icon: Icons.person,
                              textType: TextInputType.name,
                              controller: nameSignUpController,
                              //معناه ان الكلام الى جوه التكست ستناسب مع المعايير ولا لأ
                              function: (value) {
                                if (value.toString().length <= 2 ||
                                    !RegExp(validationName).hasMatch(value)) {
                                  return 'Enter valid name';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFromFieldOfApp(
                              hintText: 'Email',
                              icon: Icons.email,
                              textType: TextInputType.emailAddress,
                              controller: emailSignUpController,
                              function: (value) {
                                if (!RegExp(validationEmail).hasMatch(value)) {
                                  return 'Enter valid Email';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFromFieldOfApp(
                            hintText: 'Password',
                            icon: Icons.lock,
                            textType: TextInputType.visiblePassword,
                            obscureText: SignUpCubit.get(context).isNotVisible,
                            controller: passwordSignUpController,
                            function: (value) {
                              if (value.toString().length < 6) {
                                return 'password less than 6 numbers';
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                                onPressed: () {
                                  SignUpCubit.get(context)
                                      .changeIconOfPassword();
                                },
                                icon: Icon(
                                  SignUpCubit.get(context).iconPassword,
                                  size: 30,
                                  color: isDark?ColorsApp.pinkClr:ColorsApp.mainColor,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              // checkContainer(
                              //     function: () {
                              //       SignUpCubit.get(context).checkConditions();
                              //     },
                              //     context: context,
                              //   icon: SignUpCubit.get(context).checkIconConditions
                              // ),
                              const SizedBox(
                                width: 5,
                              ),
                              TextApp(
                                  text: 'I accept',
                                  color:  isDark?Colors.white:ColorsApp.darkGreyClr,
                                  font: 16),
                              TextButtonApp(
                                  text: 'terms & conditions',
                                  color: isDark?Colors.white:ColorsApp.darkGreyClr,
                                  underLine: TextDecoration.underline,
                                  function: () {})
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          state is CreateUserAccountLoadingState
                              ? const Center(
                            child: CircularProgressIndicator(),
                          )
                              :MaterialButtonApp(
                              text: 'SIGN UP',
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  SignUpCubit.get(context).createAccount(
                                      email: emailSignUpController.text,
                                      password: passwordSignUpController.text,
                                      name: nameSignUpController.text,
                                      context: context);
                                }
                              },
                              width: double.infinity),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    BottomContainerScreens(
                        textOfContainer: 'Already have an Account ?',
                        textOfTextButton: 'Log in',
                        function: () {
                          routeScreen(context: context, screen: const LoginScreen());
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
