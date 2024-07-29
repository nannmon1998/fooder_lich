import 'package:equatable/equatable.dart';
import 'ingredient.dart';

// class Recipe extends Equatable {
//   int? id;
//   final String? label;
//   final String? image;
//   final String? url;
//   List<Ingredient>? ingredients;
//   final double? calories;
//   final double? totalWeight;
//   final double? totalTime;
//   Recipe(
//       {this.id,
//         this.label,
//         this.image,
//         this.url,
//         this.ingredients,
//         this.calories,
//         this.totalWeight,
//         this.totalTime,
//       });
//   @override
//   List<Object?> get props => [
//     label,
//     image,
//     url,
//     ingredients,
//     calories,
//     totalWeight,
//     totalTime,
//   ];
//
//   factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
//   id: json['recipeId'],
//   label: json['label'],
//   image: json['image'],
//   url: json['url'],
//   ingredients: json['ingredients'],
//   calories: json['calories'],
//   totalWeight: json['totalWeight'],
//   totalTime: json['totalTime'],
//   );
//
//   Map<String, dynamic> toJson() => {
//     'recipeId': id,
//     'label': label,
//     'image': image,
//     'url': url,
//     'ingredients': ingredients,
//     'calories': calories,
//     'totalWeight': totalWeight,
//     'totalTime': totalTime,
//   };
//
// }

class RecipeResult {
  RecipeResult({
     this.q,
     this.from,
     this.to,
     this.more,
     this.count,
     this.hits,
  });

  final String? q;
  final int? from;
  final int? to;
  final bool? more;
  final int? count;
  final List<Hit>? hits;

  factory RecipeResult.fromJson(Map<String, dynamic> json){
    return RecipeResult(
      q: json["q"],
      from: json["from"],
      to: json["to"],
      more: json["more"],
      count: json["count"],
      hits: json["hits"] == null ? [] : List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "q": q,
    "from": from,
    "to": to,
    "more": more,
    "count": count,
    "hits": hits?.map((x) => x.toJson()).toList(),
  };

  @override
  String toString(){
    return "$q, $from, $to, $more, $count, $hits, ";
  }

}

class Hit {
  Hit({
    required this.recipe,
  });

  final Recipe? recipe;

  factory Hit.fromJson(Map<String, dynamic> json){
    return Hit(
      recipe: json["recipe"] == null ? null : Recipe.fromJson(json["recipe"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "recipe": recipe?.toJson(),
  };

  @override
  String toString(){
    return "$recipe, ";
  }

}

class Recipe {
  Recipe({
    this.id,
    this.uri,
     this.label,
     this.image,
     this.source,
     this.url,
     this.shareAs,
     this.recipeYield,
     this.dietLabels,
     this.healthLabels,
     this.cautions,
     this.ingredientLines,
     this.ingredients,
     this.calories,
     this.totalWeight,
     this.totalTime,
     this.cuisineType,
     this.mealType,
     this.dishType,
     this.totalNutrients,
     this.totalDaily,
     this.digest,
     this.tags,
  });

  int? id;
  final String? uri;
  final String? label;
  final String? image;
  final String? source;
  final String? url;
  final String? shareAs;
  final double? recipeYield;
  final List<String>? dietLabels;
  final List<String>? healthLabels;
  final List<String>? cautions;
  final List<String>? ingredientLines;
  final List<Ingredient>? ingredients;
  final double? calories;
  final double? totalWeight;
  final double? totalTime;
  final List<String>? cuisineType;
  final List<String>? mealType;
  final List<String>? dishType;
  final Map<String, Total>? totalNutrients;
  final Map<String, Total>? totalDaily;
  final List<Digest>? digest;
  final List<String>? tags;

  factory Recipe.fromJson(Map<String, dynamic> json){
    return Recipe(
      id: json['recipeId'],
      uri: json["uri"],
      label: json["label"],
      image: json["image"],
      source: json["source"],
      url: json["url"],
      shareAs: json["shareAs"],
      recipeYield: json["yield"],
      dietLabels: json["dietLabels"] == null ? [] : List<String>.from(json["dietLabels"]!.map((x) => x)),
      healthLabels: json["healthLabels"] == null ? [] : List<String>.from(json["healthLabels"]!.map((x) => x)),
      cautions: json["cautions"] == null ? [] : List<String>.from(json["cautions"]!.map((x) => x)),
      ingredientLines: json["ingredientLines"] == null ? [] : List<String>.from(json["ingredientLines"]!.map((x) => x)),
      ingredients: json["ingredients"] == null ? [] : List<Ingredient>.from(json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
      calories: json["calories"],
      totalWeight: json["totalWeight"],
      totalTime: json["totalTime"],
      cuisineType: json["cuisineType"] == null ? [] : List<String>.from(json["cuisineType"]!.map((x) => x)),
      mealType: json["mealType"] == null ? [] : List<String>.from(json["mealType"]!.map((x) => x)),
      dishType: json["dishType"] == null ? [] : List<String>.from(json["dishType"]!.map((x) => x)),
      totalNutrients: Map.from(json["totalNutrients"]).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
      totalDaily: Map.from(json["totalDaily"]).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
      digest: json["digest"] == null ? [] : List<Digest>.from(json["digest"]!.map((x) => Digest.fromJson(x))),
      tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    'recipeId': id,
    "uri": uri,
    "label": label,
    "image": image,
    "source": source,
    "url": url,
    "shareAs": shareAs,
    "yield": recipeYield,
    "dietLabels": dietLabels?.map((x) => x).toList(),
    "healthLabels": healthLabels?.map((x) => x).toList(),
    "cautions": cautions?.map((x) => x).toList(),
    "ingredientLines": ingredientLines?.map((x) => x).toList(),
    "ingredients": ingredients?.map((x) => x.toJson()).toList(),
    "calories": calories,
    "totalWeight": totalWeight,
    "totalTime": totalTime,
    "cuisineType": cuisineType?.map((x) => x).toList(),
    "mealType": mealType?.map((x) => x).toList(),
    "dishType": dishType?.map((x) => x).toList(),
    "totalNutrients": Map.from(totalNutrients!).map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
    "totalDaily": Map.from(totalDaily!).map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
    "digest": digest?.map((x) => x.toJson()).toList(),
    "tags": tags?.map((x) => x).toList(),
  };

  @override
  String toString(){
    return "$uri, $label, $image, $source, $url, $shareAs, $recipeYield, $dietLabels, $healthLabels, $cautions, $ingredientLines, $ingredients, $calories, $totalWeight, $totalTime, $cuisineType, $mealType, $dishType, $totalNutrients, $totalDaily, $digest, $tags, ";
  }

}

class Digest {
  Digest({
    required this.label,
    required this.tag,
    required this.schemaOrgTag,
    required this.total,
    required this.hasRdi,
    required this.daily,
    required this.unit,
    required this.sub,
  });

  final String? label;
  final String? tag;
  final String? schemaOrgTag;
  final double? total;
  final bool? hasRdi;
  final double? daily;
  final String? unit;
  final List<Digest> sub;

  factory Digest.fromJson(Map<String, dynamic> json){
    return Digest(
      label: json["label"],
      tag: json["tag"],
      schemaOrgTag: json["schemaOrgTag"],
      total: json["total"] ,
      hasRdi: json["hasRDI"],
      daily: json["daily"],
      unit: json["unit"],
      sub: json["sub"] == null ? [] : List<Digest>.from(json["sub"]!.map((x) => Digest.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "label": label,
    "tag": tag,
    "schemaOrgTag": schemaOrgTag,
    "total": total,
    "hasRDI": hasRdi,
    "daily": daily,
    "unit": unit,
    "sub": sub.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$label, $tag, $schemaOrgTag, $total, $hasRdi, $daily, $unit, $sub, ";
  }

}

class Ingredient {
  Ingredient({
    required this.text,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.weight,
    required this.foodCategory,
    required this.foodId,
    required this.image,
  });

  final String? text;
  final double? quantity;
  final String? measure;
  final String? food;
  final double? weight;
  final String? foodCategory;
  String? foodId;
  final String? image;

  factory Ingredient.fromJson(Map<String, dynamic> json){
    return Ingredient(
      text: json["text"],
      quantity: json["quantity"],
      measure: json["measure"],
      food: json["food"],
      weight: json["weight"],
      foodCategory: json["foodCategory"],
      foodId: json["foodId"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
    "text": text,
    "quantity": quantity,
    "measure": measure,
    "food": food,
    "weight": weight,
    "foodCategory": foodCategory,
    "foodId": foodId,
    "image": image,
  };

  @override
  String toString(){
    return "$text, $quantity, $measure, $food, $weight, $foodCategory, $foodId, $image, ";
  }

}

class Total {
  Total({
    required this.label,
    required this.quantity,
    required this.unit,
  });

  final String? label;
  final double? quantity;
  final String? unit;

  factory Total.fromJson(Map<String, dynamic> json){
    return Total(
      label: json["label"],
      quantity: json["quantity"],
      unit: json["unit"],
    );
  }

  Map<String, dynamic> toJson() => {
    "label": label,
    "quantity": quantity,
    "unit": unit,
  };

  @override
  String toString(){
    return "$label, $quantity, $unit, ";
  }

}

String getCalories(double? calories) {
  if (calories == null) {
    return '0 KCAL';
  }
  return '${calories.floor()} KCAL';
}

String getWeight(double? weight) {
  if (weight == null) {
    return '0g';
  }
  return '${weight.floor()}g';
}

