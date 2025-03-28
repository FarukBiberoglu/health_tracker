import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/enum/planned_meals_enum.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'food_cache_model.g.dart';

@HiveType(typeId: 14)
class FoodCacheModel extends HiveObject {
  FoodCacheModel({required this.date, required this.foodEntries});

  factory FoodCacheModel.empty(DateTime date) {
    return FoodCacheModel(
      date: date,
      foodEntries: {for (final meal in PlannedMealsEnum.values) meal: []},
    );
  }

  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  Map<PlannedMealsEnum, List<FoodModel>> foodEntries;

  FoodCacheModel copyWith({
    DateTime? date,
    Map<PlannedMealsEnum, List<FoodModel>>? foodEntries,
  }) {
    return FoodCacheModel(
      date: date ?? this.date,
      foodEntries:
          foodEntries ??
          {
            for (final entry in this.foodEntries.entries)
              entry.key: List<FoodModel>.from(entry.value),
          },
    );
  }
}
