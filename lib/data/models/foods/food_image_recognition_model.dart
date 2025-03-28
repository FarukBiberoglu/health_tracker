import 'package:calory_tool/data/models/foods/food_eaten_model.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/data/models/foods/food_suggested_serving_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'food_image_recognition_model.g.dart';

@HiveType(typeId: 1)
class FoodImageRecognitionModel extends HiveObject {
  FoodImageRecognitionModel({
    this.foodId,
    this.foodName,
    this.eaten,
    this.suggestedServing,
    this.food,
  });

  factory FoodImageRecognitionModel.fromJson(Map<String, dynamic> data) {
    return FoodImageRecognitionModel(
      foodId: data['food_id'] as int?,
      foodName: data['food_entry_name'] as String?,
      eaten:
          data['eaten'] != null
              ? FoodEatenModel.fromJson(data['eaten'] as Map<String, dynamic>)
              : null,
      suggestedServing:
          data['suggested_serving'] != null
              ? FoodSuggestedServingModel.fromJson(
                data['suggested_serving'] as Map<String, dynamic>,
              )
              : null,
      food:
          data['food'] != null
              ? FoodModel.fromJson(data['food'] as Map<String, dynamic>)
              : null,
    );
  }

  @HiveField(0)
  final int? foodId;

  @HiveField(1)
  final String? foodName;

  @HiveField(2)
  final FoodEatenModel? eaten;

  @HiveField(3)
  final FoodSuggestedServingModel? suggestedServing;

  @HiveField(4)
  final FoodModel? food;
}
