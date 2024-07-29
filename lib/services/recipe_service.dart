import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/recipe.dart';

class RecipeService {
  static String apiKey = 'ea06afa2c7dfe30929d8369dd0cd880a';
  static String apiId = '8ffdb8a1';
  static String apiUrl = 'https://api.edamam.com';

  late var options;
  late Dio dio;
  static RecipeService? _instance;

  RecipeService._internal() {
    _instance = this;
  }

  factory RecipeService() {
    if (_instance == null) {
      RecipeService._internal();
      _instance!.options = BaseOptions(baseUrl: apiUrl, queryParameters: {
        "app_id": apiId,
        "app_key": apiKey,
      });
      _instance!.dio = Dio(_instance!.options);
    } else {
      _instance!.options = BaseOptions(baseUrl: apiUrl, queryParameters: {
        "app_id": apiId,
        "app_key": apiKey,
      });
      _instance!.dio = Dio(_instance!.options);
    }
    return _instance ?? RecipeService._internal();
  }

  Future<RecipeResult?> getRecipeResult(
      {required String query, required int from, required int to}) async {
      RecipeResult? recipeResult;
      var response = await dio.get('/search', queryParameters: {
        "q": query,
        "from": from,
        "to": to,
      });
      if (response.statusCode == 200) {
        recipeResult = RecipeResult.fromJson(json.decode(response.toString()));
      }
    return recipeResult;
  }
}
