import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fooderlich/res/app_images.dart';
import 'package:fooderlich/res/app_text_style.dart';
import 'package:get/get.dart';
import '../../controller/recipe_controller.dart';
import 'components/category_icon.dart';
import 'components/custom_appbar.dart';
import 'components/diet.dart';
import 'components/recipe_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedIcon = 'desert';
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  final controller = Get.put(RecipeController());

  @override
  void initState() {
    super.initState();
    controller.getRecipeResult(
        q: selectedIcon,
        from: currentStartPosition,
        to: currentEndPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomAppBar(),
              Text(
                "Let's Check Food \nNutrition & Calories",
                style: titleTextStyle,
              ),
              Text(
                "Select food type to see calories",
                style: subTitleTextStyle,
              ),
              SizedBox(
                height: 70.0,
                child: ListView.builder(
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    AppImage appImage = images[index];
                    return CategoryIcon(
                      imageUrl: appImage.imagePath!,
                      onTap: () {
                        setState(() {
                          selectedIcon = appImage.label!;
                          controller.getRecipeResult(
                              q: selectedIcon,
                              from: currentStartPosition,
                              to: currentEndPosition);
                        });
                      },
                      isSelected: selectedIcon == appImage.label! ? true : false,
                    );
                  },
                ),
              ),

              Obx(() =>  RecipeItem( controller.count,controller.recipeResult,)),
              const Diet(),
            ],
          ),
        ),
      ),
    );
  }
}
