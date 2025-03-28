import 'package:hive_flutter/hive_flutter.dart';

part 'food_category_model.g.dart';

@HiveType(typeId: 3)
class FoodCategoryModel extends HiveObject {
  FoodCategoryModel({this.id, this.name, this.description});

  factory FoodCategoryModel.fromJson(Map<String, dynamic> json) {
    return FoodCategoryModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );
  }

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? description;
}
