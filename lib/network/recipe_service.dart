import 'package:chopper/chopper.dart';
import 'package:fooderlich/network/recipe_model.dart';
import 'package:fooderlich/network/response_model.dart';
import 'model_converter.dart';
import 'service_interface.dart';
part 'recipe_service.chopper.dart';

const String apiKey = 'ea06afa2c7dfe30929d8369dd0cd880a';
const String apiId = '8ffdb8a1';
const String apiUrl = 'https://api.edamam.com';

// class RecipeService{
//   Future getData(String url) async {
//     final response = await get(Uri.parse(url));
//     if(response.statusCode == 200){
//       return response.body;
//     }
//     else {
//       print(response.body);
//     }
//   }
//   //add getRecipes
//   Future<dynamic> getRecipes(String query,int from,int to) async {
//     final recipeData =
//         await getData('$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
//     return recipeData;
//   }
// }

@ChopperApi()
abstract class RecipeService extends ChopperService implements ServiceInterface{
  @override
  @Get(path : 'search')
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
      @Query('q') String query, @Query('from') int from,
      @Query('to') int to
      );
  static RecipeService create(){
    final client = ChopperClient(
      baseUrl: Uri.parse(apiUrl),
      interceptors: [_addQuery, HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$RecipeService(),
      ],
    );
    return _$RecipeService(client);
  }
}

Request _addQuery(Request req) {
  final params = Map<String, dynamic>.from(req.parameters);
  params['app_id'] = apiId;
  params['app_key'] = apiKey;
  return req.copyWith(parameters: params);
}
