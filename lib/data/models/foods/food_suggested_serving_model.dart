import 'package:hive_flutter/hive_flutter.dart';

part 'food_suggested_serving_model.g.dart';

@HiveType(typeId: 9)
class FoodSuggestedServingModel extends HiveObject {
  FoodSuggestedServingModel({
    this.servingId,
    this.servingDescription,
    this.metricServingDescription,
    this.metricMeasureAmount,
    this.numberOfUnits,
  });

  factory FoodSuggestedServingModel.fromJson(Map<String, dynamic> json) {
    return FoodSuggestedServingModel(
      servingId: json['serving_id'] as int?,
      servingDescription: json['serving_description'] as String?,
      metricServingDescription: json['metric_serving_description'] as String?,
      metricMeasureAmount: (json['metric_measure_amount'] as num?)?.toDouble(),
      numberOfUnits: (json['number_of_units'] as num?)?.toDouble(),
    );
  }

  @HiveField(0)
  final int? servingId;

  @HiveField(1)
  final String? servingDescription;

  @HiveField(2)
  final String? metricServingDescription;

  @HiveField(3)
  final double? metricMeasureAmount;

  @HiveField(4)
  final double? numberOfUnits;
}
