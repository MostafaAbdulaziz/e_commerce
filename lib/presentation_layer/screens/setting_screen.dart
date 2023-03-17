
import 'package:e_commerce/presentation_layer/controller/Cubit/main_cubit/main_cubit.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/main_cubit/main_states.dart';
import 'package:e_commerce/presentation_layer/widgets/material_button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state){},
      builder: (context,state)=>Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButtonApp(text: 'sign out', function: (){
                MainCubit.get(context).signUpWithEmailAndPass(context);
              }),
              MaterialButtonApp(text: 'Mode', function: (){
                MainCubit.get(context).changeMode();
              }),
            ],
          )
        ),
      ),
    );
  }
}
