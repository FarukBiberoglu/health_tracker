import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'food_search_model.g.dart';

@HiveType(typeId: 7)
class FoodSearchModel extends HiveObject {
  FoodSearchModel({required this.foods, this.pageNumber});

  factory FoodSearchModel.fromJson(Map<String, dynamic> json) {
    final foods = json['foods'] as List? ?? [];
    return FoodSearchModel(
      pageNumber: (json['page_number'] as num?)?.toInt(),
      foods:
          foods
              .map((dynamic e) => FoodModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  @HiveField(0)
  final int? pageNumber;
  @HiveField(1)
  final List<FoodModel> foods;
}
