import 'package:hive_flutter/hive_flutter.dart';

part 'food_preference_model.g.dart';

@HiveType(typeId: 6)
class FoodPreferenceModel extends HiveObject {
  FoodPreferenceModel({required this.id, required this.name, this.value});

  factory FoodPreferenceModel.fromJson(Map<String, dynamic> json) {
    return FoodPreferenceModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      value: json['value'] as bool?,
    );
  }

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final bool? value;
}
