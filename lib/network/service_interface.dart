import 'package:chopper/chopper.dart';
import 'package:fooderlich/network/response_model.dart';
import 'recipe_model.dart';

abstract class ServiceInterface {
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
    String query,
    int from,
    int to,
  );
}
