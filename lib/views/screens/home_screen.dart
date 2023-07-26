import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:itmedicus/views/widgets/custom_floating_action_button_widget.dart';
import '../../controller/home_banner_controller.dart';

import '../../views/widgets/custom_navbar_widget.dart';
import '../../views/widgets/my_app_icons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeBannerController = Get.put(HomeBannerController());

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color(0xFFf0f7ff),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, MR. Rakib",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Text("ITmedicus",
                  style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(
                height: 10,
              ),
              Text("Health Care",
                  style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                items: homeBannerController.sliderImageList.map((element) {
                  return Container(
                    width: MediaQuery.sizeOf(context).width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            image: Image.network(element).image)),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 7,
                              mainAxisSpacing: 7),
                      itemCount: homeBannerController.bannerImageList.length,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                            onTap: () {},
                            child: Image.network(
                                homeBannerController.bannerImageList[index]));
                      }))
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavbarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: const CustomFloatingActionButtonWidget(),
    );
  }
}
