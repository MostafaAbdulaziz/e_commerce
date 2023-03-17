import 'package:e_commerce/core/routes/routes_screens.dart';
import 'package:e_commerce/core/valiables.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/login_cubit/login_cubit.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/login_cubit/login_states.dart';
import 'package:e_commerce/presentation_layer/widgets/material_button_app.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:e_commerce/presentation_layer/widgets/textfromfield_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors_app.dart';

var formKey = GlobalKey<FormState>();

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title:  TextApp(
              text: 'Forget Password',
              color: isDark?ColorsApp.pinkClr:ColorsApp.mainColor,
              font: 25
            ),
            leading: IconButton(
              onPressed: () {
                backScreen(context: context);
              },
              icon:  Icon(
                Icons.arrow_back_ios_new_rounded,
                color:  isDark?Colors.white:ColorsApp.darkGreyClr,
              ),
            ),
            centerTitle: true,

          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          backScreen(context: context);
                        },
                        icon:  Icon(
                          Icons.close_rounded,
                          color:  isDark?Colors.white:ColorsApp.darkGreyClr,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextApp(
                        text:
                            'if you want to recover your account, then please provide your email ID below ...',
                        color: isDark?Colors.white:ColorsApp.darkGreyClr,
                        font: 15,
                        height: 1.5),
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset('assets/images/forgetpass copy.png'),
                    const SizedBox(
                      height: 50,
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
                        controller: emailForgetPasswordController),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButtonApp(
                        text: 'SEND',
                        function: () {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).forgetPasswordOfEmail(
                                email: emailForgetPasswordController.text,
                                context: context);
                          }
                        },
                        width: double.infinity),
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
