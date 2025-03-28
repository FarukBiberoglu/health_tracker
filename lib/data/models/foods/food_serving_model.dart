import 'package:hive_flutter/hive_flutter.dart';

part 'food_serving_model.g.dart';

@HiveType(typeId: 8)
class FoodServingModel extends HiveObject {
  FoodServingModel({
    required this.id,
    required this.description,
    required this.url,
    required this.metricServingAmount,
    required this.metricServingUnit,
    required this.numberOfUnits,
    required this.measurementDescription,
    required this.calories,
    required this.carbohydrate,
    required this.protein,
    required this.fat,
    required this.saturatedFat,
    required this.polyunsaturatedFat,
    required this.monounsaturatedFat,
    required this.cholesterol,
    required this.sodium,
    required this.potassium,
    required this.fiber,
    required this.sugar,
    required this.addedSugars,
    required this.vitaminA,
    required this.vitaminC,
    required this.vitaminD,
    required this.calcium,
    required this.iron,
  });

  factory FoodServingModel.fromJson(Map<String, dynamic> json) {
    return FoodServingModel(
      id: json['id'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      metricServingAmount: (json['metric_serving_amount'] as num?)?.toDouble(),
      metricServingUnit: json['metric_serving_unit'] as String?,
      numberOfUnits: (json['number_of_units'] as num?)?.toDouble(),
      measurementDescription: json['measurement_description'] as String?,
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
      addedSugars: (json['added_sugars'] as num?)?.toDouble(),
      vitaminA: (json['vitamin_a'] as num?)?.toDouble(),
      vitaminC: (json['vitamin_c'] as num?)?.toDouble(),
      vitaminD: (json['vitamin_d'] as num?)?.toDouble(),
      calcium: (json['calcium'] as num?)?.toDouble(),
      iron: (json['iron'] as num?)?.toDouble(),
    );
  }

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final String? url;
  @HiveField(3)
  final double? metricServingAmount;
  @HiveField(4)
  final String? metricServingUnit;
  @HiveField(5)
  final double? numberOfUnits;
  @HiveField(6)
  final String? measurementDescription;
  @HiveField(7)
  final double? calories;
  @HiveField(8)
  final double? carbohydrate;
  @HiveField(9)
  final double? protein;
  @HiveField(10)
  final double? fat;
  @HiveField(11)
  final double? saturatedFat;
  @HiveField(12)
  final double? polyunsaturatedFat;
  @HiveField(13)
  final double? monounsaturatedFat;
  @HiveField(14)
  final double? cholesterol;
  @HiveField(15)
  final double? sodium;
  @HiveField(16)
  final double? potassium;
  @HiveField(17)
  final double? fiber;
  @HiveField(18)
  final double? sugar;
  @HiveField(19)
  final double? addedSugars;
  @HiveField(20)
  final double? vitaminA;
  @HiveField(21)
  final double? vitaminC;
  @HiveField(22)
  final double? vitaminD;
  @HiveField(23)
  final double? calcium;
  @HiveField(24)
  final double? iron;
}
