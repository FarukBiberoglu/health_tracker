import 'package:hive_flutter/hive_flutter.dart';

part 'food_allergen_model.g.dart';

@HiveType(typeId: 2)
class FoodAllergenModel extends HiveObject {
  FoodAllergenModel({required this.id, required this.name, this.value});

  factory FoodAllergenModel.fromJson(Map<String, dynamic> json) {
    return FoodAllergenModel(
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
