import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/core/colors_app.dart';
import 'package:e_commerce/core/routes/routes_screens.dart';
import 'package:e_commerce/core/valiables.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/main_cubit/main_cubit.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/main_cubit/main_states.dart';
import 'package:e_commerce/presentation_layer/widgets/material_button_app.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:e_commerce/presentation_layer/widgets/textfromfield_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/lists.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        builder: (context, state) => SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: isDark ? ColorsApp.darkGreyClr : ColorsApp.mainColor,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextApp(text: 'Find your', font: 20),
                            const TextApp(text: 'INSPIRATION', font: 20),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFromFieldOfApp(
                                      hintText: 'search',
                                      icon: Icons.search,
                                      textType: TextInputType.text,
                                      function: () {},
                                      controller: searchController),
                                ),
                                const Icon(
                                  Icons.line_weight_sharp,
                                  size: 40,
                                  color: Colors.white,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextApp(
                                    text: 'Categories',
                                    color: isDark ? Colors.white : ColorsApp.darkGreyClr,
                                    font: 25),
                                const Spacer(),
                                MaterialButtonApp(
                                    text: 'select', function: () {}, width: 50)
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ConditionalBuilder(
                                condition: products.isNotEmpty,
                                builder: (context)=>GridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  children: List.generate(products.length,
                                          (index) => itemOfGrid(index,context)),
                                ),
                                fallback:(context)=> const Center(
                                  child: CircularProgressIndicator(),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
        listener: (context, state) {});
  }

  Widget itemOfGrid(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          routeScreen(context: context, screen: const ProductDetailsScreen());
        } else if (index == 5) {
          print('5');
        } else if (index == 6) {
          print('6');
        }
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: isDark ? Colors.white : ColorsApp.mainColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: isDark ? Colors.white : ColorsApp.darkGreyClr, blurRadius: 5)
            ]),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {
                  MainCubit.get(context).addFavouriteProducts(index);
                }, icon: MainCubit.get(context).iconFavourite),
                const Spacer(),
                Container(
                    width: 80,
                    child: TextApp(
                        text: products[index]['title'],
                        font: 12,
                        color: isDark ? ColorsApp.darkGreyClr : Colors.white)),
                const Spacer(),
                const Icon(Icons.add)
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                      products[index]['image'],
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  TextApp(
                    text: '${products[index]['price']}',
                    font: 13,
                    color: isDark ? ColorsApp.darkGreyClr : Colors.white,
                  ),
                  const Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          color: isDark ? ColorsApp.mainColor : ColorsApp.darkGreyClr,
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          TextApp(
                            text: '${products[index]['rating']['rate']} ',
                            font: 13,
                            color: isDark ? ColorsApp.darkGreyClr : Colors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: isDark ? ColorsApp.darkGreyClr : Colors.white,
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
