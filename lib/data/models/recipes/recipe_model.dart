import 'package:calory_tool/data/models/recipes/recipe_nutrition_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'recipe_model.g.dart';

@HiveType(typeId: 10)
class RecipeModel extends HiveObject {
  RecipeModel({
    required this.ingredients,
    required this.types,
    this.id,
    this.name,
    this.description,
    this.image,
    this.nutrition,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      ingredients: List<String>.from(json['ingredients'] as List? ?? []),
      types: List<String>.from(json['types'] as List? ?? []),
      nutrition:
          json['nutrition'] != null
              ? RecipeNutritionModel.fromJson(
                json['nutrition'] as Map<String, dynamic>,
              )
              : null,
    );
  }

  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final String? image;

  @HiveField(4)
  final List<String> ingredients;

  @HiveField(5)
  final List<String> types;

  @HiveField(6)
  final RecipeNutritionModel? nutrition;
}
