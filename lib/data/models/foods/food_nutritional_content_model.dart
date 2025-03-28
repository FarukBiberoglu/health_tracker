import 'package:hive_flutter/hive_flutter.dart';

part 'food_nutritional_content_model.g.dart';

@HiveType(typeId: 5)
class FoodNutritionalContentModel extends HiveObject {
  FoodNutritionalContentModel({
    this.calories,
    this.carbohydrate,
    this.protein,
    this.fat,
    this.saturatedFat,
    this.polyunsaturatedFat,
    this.monounsaturatedFat,
    this.cholesterol,
    this.sodium,
    this.potassium,
    this.fiber,
    this.sugar,
    this.vitaminA,
    this.vitaminC,
    this.calcium,
    this.iron,
  });

  factory FoodNutritionalContentModel.fromJson(Map<String, dynamic> json) {
    return FoodNutritionalContentModel(
      calories: (json['calories'] as num?)?.toDouble(),
      carbohydrate: (json['carbohydrate'] as num?)?.toDouble(),
      protein: (json['protein'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      saturatedFat: (json['saturated_fat'] as num?)?.toDouble(),
      polyunsaturatedFat: (json['polyunsaturated_fat'] as num?)?.toDouble(),
      monounsaturatedFat: (json['monounsaturated_fat'] as num?)?.toDouble(),
      cholesterol: (json['cholesterol'] as num?)?.toDouble(),
      sodium: (json['sodium'] as num?)?.toDouble(),
      potassium: (json['potassium'] as num?)?.toDouble(),
      fiber: (json['fiber'] as num?)?.toDouble(),
      sugar: (json['sugar'] as num?)?.toDouble(),
      vitaminA: (json['vitamin_a'] as num?)?.toDouble(),
      vitaminC: (json['vitamin_c'] as num?)?.toDouble(),
      calcium: (json['calcium'] as num?)?.toDouble(),
      iron: (json['iron'] as num?)?.toDouble(),
    );
  }

  @HiveField(0)
  final double? calories;
  @HiveField(1)
  final double? carbohydrate;
  @HiveField(2)
  final double? protein;
  @HiveField(3)
  final double? fat;
  @HiveField(4)
  final double? saturatedFat;
  @HiveField(5)
  final double? polyunsaturatedFat;
  @HiveField(6)
  final double? monounsaturatedFat;
  @HiveField(7)
  final double? cholesterol;
  @HiveField(8)
  final double? sodium;
  @HiveField(9)
  final double? potassium;
  @HiveField(10)
  final double? fiber;
  @HiveField(11)
  final double? sugar;
  @HiveField(12)
  final double? vitaminA;
  @HiveField(13)
  final double? vitaminC;
  @HiveField(14)
  final double? calcium;
  @HiveField(15)
  final double? iron;
}
