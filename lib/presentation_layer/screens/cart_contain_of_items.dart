import 'package:e_commerce/core/colors_app.dart';
import 'package:e_commerce/core/valiables.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:flutter/material.dart';
import '../../core/lists.dart';
class CartOfItems extends StatelessWidget {
  const CartOfItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => itemOfListView(index),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: products.length),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextApp(
                        text: 'Total',
                        font: 16,
                        color: isDark
                            ? Colors.white.withOpacity(0.5)
                            : ColorsApp.darkGreyClr.withOpacity(0.5),
                    ),
                    const SizedBox(height: 5,),

                    TextApp(
                      text: '\$680.22',
                      font: 16,
                      color: isDark
                          ? Colors.white
                          : ColorsApp.darkGreyClr,
                    ),

                  ],
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: MaterialButton(
                      height: 45,
                      color: isDark ? ColorsApp.pinkClr : ColorsApp.mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const  [
                          TextApp(text: 'Check Out', font: 18),
                           SizedBox(
                            width: 5,
                          ),
                           Icon(Icons.shopping_cart)
                        ],
                      )),
                )
              ],
            )
          ],
        ));
  }

  Widget itemOfListView(index) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 0, top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: isDark ? ColorsApp.pinkClr.withOpacity(0.7) : ColorsApp.mainColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: isDark ? Colors.white : ColorsApp.darkGreyClr, blurRadius: 5)
          ]),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                      products[index]['image']
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(0),
                width: 100,
                child: TextApp(
                    text: products[index]['title'],
                    font: 15,
                    color: isDark ? Colors.white : ColorsApp.darkGreyClr),
              ),
              const SizedBox(
                height: 10,
              ),
              TextApp(
                  text: '${products[index]['price']}',
                  font: 12,
                  color: isDark ? Colors.white : ColorsApp.darkGreyClr),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_circle,
                          color: isDark ? Colors.white : ColorsApp.darkGreyClr,
                        )),
                    const TextApp(text: '1', font: 15),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle,
                          color: isDark ? Colors.white : ColorsApp.darkGreyClr,
                        ))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: isDark ? ColorsApp.darkGreyClr : Colors.red,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
