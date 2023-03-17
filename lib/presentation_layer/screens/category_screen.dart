import 'package:e_commerce/presentation_layer/controller/Cubit/main_cubit/main_cubit.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/main_cubit/main_states.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state){},
      builder: (context,state)=>const Scaffold(
        body: Center(
          child: TextApp(text: 'Categories Screen',color: Colors.black),
        ),
      ),
    );
  }
}
