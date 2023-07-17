import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  int? id;
  int? recipeId;
  final String? name;
  final double? weight;

  Ingredient({
    this.id,
    this.recipeId,
    this.name,
    this.weight,
  });

  // @override
  // bool operator == (Object other) {
  //     other = other as Ingredient;
  //   return this.id == other.id && recipeId == other.recipeId && weight == other.weight;
  // }
  //
  // @override
  // int get hashCode {
  //   int hash = id.hashCode;
  //   hash = hash * 32 + name.hashCode;
  //   hash = hash * 32 + weight.hashCode;
  //   return hash;
  // }
  //
  // @override
  // String toString() {
  //   return "$id is recipe Id with $recipeId and name $name and weight $weight";
  //}

  // 4

  @override
  List<Object?> get props => [
        recipeId,
        name,
        weight,
      ];

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      Ingredient(
        id: json['ingredientId'],
        recipeId: json['recipeId'],
        name: json['name'],
        weight: json['weight'],
      );

  Map<String, dynamic> toJson() => {
    'ingredientId': id,
    'recipeId': recipeId,
    'name': name,
    'weight': weight,
  };
}
