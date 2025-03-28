import 'package:hive_flutter/hive_flutter.dart';

part 'recipe_nutrition_model.g.dart';

@HiveType(typeId: 11)
class RecipeNutritionModel extends HiveObject {
  RecipeNutritionModel({
    this.calories,
    this.carbohydrates,
    this.fat,
    this.protein,
  });

  factory RecipeNutritionModel.fromJson(Map<String, dynamic> json) {
    return RecipeNutritionModel(
      calories: (json['calories'] as num?)?.toInt(),
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      protein: (json['protein'] as num?)?.toDouble(),
    );
  }

  @HiveField(0)
  final int? calories;

  @HiveField(1)
  final double? carbohydrates;

  @HiveField(2)
  final double? fat;

  @HiveField(3)
  final double? protein;
}
