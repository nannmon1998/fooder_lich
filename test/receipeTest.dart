import 'package:flutter_test/flutter_test.dart';
import 'package:fooderlich/model/ingredient.dart';

void main(){
  test("Test Receipe", (){
    Ingredient ingredient = Ingredient(id: 001,recipeId: 002,name: "cook",weight: 1.23);
    Ingredient ingredient2 = Ingredient(id: 001,recipeId: 002,name: "cook",weight: 1.23);
    expect(true,ingredient == ingredient2);
    expect(ingredient.hashCode,ingredient2.hashCode);
  });
}