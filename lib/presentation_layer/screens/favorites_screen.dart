import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/core/colors_app.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/main_cubit/main_cubit.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/main_cubit/main_states.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/lists.dart';
import '../../core/valiables.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
          body: ConditionalBuilder(
              condition: favouriteProducts.isNotEmpty,
              builder: (context) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => itemOfFavourite(index),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: favouriteProducts.length),
                  ),
              fallback: (context)=>Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/heart.png',
                      width: 100,
                      height: 100,
                    ),
                    TextApp(
                        text: 'You don\'t have a favorite product',
                        color: isDark ? Colors.white : ColorsApp.darkGreyClr.withOpacity(0.6),
                        font: 18
                    )
                  ],
                ),
              ),)),
    );
  }

  Widget itemOfFavourite(int index) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: isDark ? Colors.white : ColorsApp.mainColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: isDark ? Colors.white : ColorsApp.darkGreyClr, blurRadius: 5)
            ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image:  DecorationImage(
                      image: NetworkImage(
                        favouriteProducts[index]['image'],
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: TextApp(
                      text: favouriteProducts[index]['title'],
                      font: 15,
                      color: isDark ? ColorsApp.darkGreyClr : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextApp(
                    text: 'Brand name',
                    font: 12,
                    color:
                        isDark ? ColorsApp.darkGreyClr.withOpacity(0.7) : Colors.white),
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      );
}


