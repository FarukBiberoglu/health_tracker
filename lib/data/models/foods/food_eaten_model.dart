import 'package:calory_tool/data/models/foods/food_nutritional_content_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'food_eaten_model.g.dart';

@HiveType(typeId: 4)
class FoodEatenModel extends HiveObject {
  FoodEatenModel({
    this.singularDescription,
    this.pluralDescription,
    this.units,
    this.metricDescription,
    this.totalMetricAmount,
    this.perUnitMetricAmount,
    this.totalNutritionalContent,
  });

  factory FoodEatenModel.fromJson(Map<String, dynamic> json) {
    return FoodEatenModel(
      singularDescription: json['singular_description'] as String?,
      pluralDescription: json['plural_description'] as String?,
      units: (json['units'] as num?)?.toDouble(),
      metricDescription: json['metric_description'] as String?,
      totalMetricAmount: json['total_metric_amount'] as double?,
      perUnitMetricAmount: json['per_unit_metric_amount'] as double?,
      totalNutritionalContent:
          json['total_nutritional_content'] != null
              ? FoodNutritionalContentModel.fromJson(
                json['total_nutritional_content'] as Map<String, dynamic>,
              )
              : null,
    );
  }

  @HiveField(0)
  final String? singularDescription;
  @HiveField(1)
  final String? pluralDescription;
  @HiveField(2)
  final double? units;
  @HiveField(3)
  final String? metricDescription;
  @HiveField(4)
  final double? totalMetricAmount;
  @HiveField(5)
  final double? perUnitMetricAmount;
  @HiveField(6)
  final FoodNutritionalContentModel? totalNutritionalContent;
}
