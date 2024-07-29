import 'package:flutter/material.dart';
import 'package:fooderlich/res/app_text_style.dart';
import '../../model/recipe.dart';
import '../../res/app_colors.dart';
import 'components/curve_clipper.dart';

class RecipeDetails extends StatelessWidget {
  Recipe recipe;

  RecipeDetails({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: greenColor,
          actions: const [
            Icon(
              Icons.search,
              color: blackColor,
            ),
            SizedBox(
              width: 10.0,
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            // ClipPath(
            // clipper: CurveClipper(),
            //   child: Container(
            //     color: greenColor,
            //     height: 240.0,
            //   ),
            // ),
            CustomPaint(
              painter: HeaderCurvedContainer(),
              child: Container(
                height: 250.0,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.only(top: 100.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(recipe.image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(recipe.label!, style: titleTextStyle),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: recipe.ingredients!.length > 8 ? 200 :
                          recipe.ingredients!.length > 4 ? 150 :  70,
                  child: GridView.builder(
                    itemCount: recipe.ingredients?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.4,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      Ingredient? ingredients = recipe.ingredients?[index];
                      return Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                  color: lightGrey,
                                  offset: Offset(2, 1),
                                  blurRadius: 2),
                              BoxShadow(
                                  color: whiteColor,
                                  offset: Offset(-2, -1),
                                  blurRadius: 2)
                            ],
                            color: whiteColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              getWeight(ingredients!.weight),
                              style: smallSubTitleTextStyle,
                            ),
                            Text(
                              ingredients.food!,
                              style: smallTitleTextStyle,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      height: 54,
                      margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                      padding: const EdgeInsets.all(18.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: greenColor,
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      ),
                      child: const Center(
                        child: Text(
                          "CHECK THE RECIPE",
                          style: TextStyle(color: whiteColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
