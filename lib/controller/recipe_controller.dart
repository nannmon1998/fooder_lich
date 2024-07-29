import 'package:flutter/material.dart';
import 'package:fooderlich/services/recipe_service.dart';
import 'package:get/get.dart';

import '../model/recipe.dart';

class RecipeController extends GetxController {
  final Rx<RecipeResult> _recipeResult = RecipeResult().obs;
  RecipeResult get recipeResult => _recipeResult.value;

  static const  MAX_ITEM_COUNT = 100;

  final Rx<int> _count = MAX_ITEM_COUNT.obs;
  get count => _count.value;



  final Rx<String> _q = ''.obs;
  get query => _q.value;

  Future<RecipeResult?> getRecipeResult(
      {required String q, required int from, required int to}) async {
    RecipeService apiService = RecipeService();
      RecipeResult? recipeResult =
      await apiService.getRecipeResult(query: q, from: from, to: to);
      debugPrint("controller result --> $recipeResult");
      if (recipeResult != null) {
        _recipeResult.value = recipeResult;
        if(recipeResult.count! < MAX_ITEM_COUNT){
          _count.value =  recipeResult.count!;
        }
      }
      return recipeResult;
  }
}
