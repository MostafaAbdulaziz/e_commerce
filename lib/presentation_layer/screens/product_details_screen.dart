import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/colors_app.dart';
import 'package:e_commerce/presentation_layer/widgets/text_of_app.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/valiables.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      SizedBox(
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/back.jpeg'),
                          ),
                          color: Colors.yellowAccent),
                    ),
                  ),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 1.2,
                    initialPage: 0,
                    // onPageChanged: (int index){}
                  ),
                  carouselController: carouselController,
                ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FloatingActionButton(
                          mini: true,
                          backgroundColor: isDark ? ColorsApp.pinkClr : ColorsApp.mainColor,
                          onPressed: () {},
                          child: const Icon(Icons.arrow_back_ios),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmoothPageIndicator(
                              controller: pageController,
                              count: 3,
                              axisDirection: Axis.horizontal,
                              effect: ExpandingDotsEffect(
                                  spacing: 8.0,
                                  radius: 10.0,
                                  dotWidth: 20.0,
                                  dotHeight: 7.0,
                                  paintStyle: PaintingStyle.fill,
                                  strokeWidth: 1.5,
                                  dotColor: Colors.white,
                                  activeDotColor: isDark ? ColorsApp.pinkClr : ColorsApp.mainColor,
                                  expansionFactor: 2),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextApp(
                            text: 'Mens Casual Slim Fit',
                            font: 18,
                            color: isDark ? Colors.white : ColorsApp.darkGreyClr),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            TextApp(
                                text: '2.1',
                                font: 12,
                                color: isDark ? Colors.white : ColorsApp.darkGreyClr),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 17,
                    backgroundColor: isDark ? Colors.white : ColorsApp.mainColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextApp(
                  font: 14,
                  maxLine: 3,
                  color: isDark ? Colors.white.withOpacity(0.7) : Colors.grey,
                  text:
                      'The Color Could be slightly different between on the screen and in practice/please note that body builds vary by persons The Color Could be slightly different between on the screen and in practice/please note that body builds vary by persons '),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
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
                          children: const [
                            TextApp(text: 'Check Out', font: 18),
                             SizedBox(
                              width: 5,
                            ),
                             Icon(Icons.shopping_cart)
                          ],
                        )),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
