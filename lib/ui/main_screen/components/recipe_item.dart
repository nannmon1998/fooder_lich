import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fooderlich/ui/recipe_details/recipe_details.dart';
import '../../../model/recipe.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_text_style.dart';

class RecipeItem extends StatefulWidget {
  int count;
  RecipeResult recipeResult;

  RecipeItem(this.count, this.recipeResult,{super.key});

  @override
  State<RecipeItem> createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  final ScrollController _scrollController = ScrollController();
  List<Hit> currentRecipeList = [];
  int currentCount = 0;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  int currentStartPosition = 0;
  int currentEndPosition = 20;

  @override
  void initState() {
    currentCount = widget.count;
    _scrollController.addListener(() {
      final triggerFetchMoreSize =
          0.7 * _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels > triggerFetchMoreSize) {
        if (hasMore &&
            currentEndPosition < currentCount &&
            !loading ) {
          setState(() {
            loading = true;
            currentStartPosition = currentEndPosition;
            currentEndPosition =
                min(currentStartPosition + pageCount, currentCount);
          });
        }
      }
    });


    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    hasMore = widget.recipeResult.more ?? false;
    var to = widget.recipeResult.to ?? 0;
    if (to < currentEndPosition) {
      currentEndPosition = to;
    }
    currentRecipeList.addAll(widget.recipeResult.hits ?? <Hit>[]);
    return SizedBox(
      height: 260,
      child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 1.3),
          itemCount: currentRecipeList.length,
          itemBuilder: (BuildContext context, int index) {
            loading = false;

            Hit? hit = currentRecipeList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecipeDetails(recipe: hit.recipe!,)),
                );
              },
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    height: 190,
                    width: 170,
                    margin: const EdgeInsets.only(top: 60.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(
                              color: lightGrey,
                              offset: Offset(4, 2),
                              blurRadius: 8),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -2),
                              blurRadius: 8)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 100.0, left: 14.0, right: 14.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  hit.recipe!.label!,
                                  style: smallTitleTextStyle,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                getCalories(hit.recipe?.calories!),
                                style: smallSubTitleTextStyle,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RecipeDetails(recipe: hit.recipe!,)),
                                  );
                                },
                                child: const Icon(
                                  Icons.double_arrow_outlined,
                                  color: greenColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          hit.recipe!.image!,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
