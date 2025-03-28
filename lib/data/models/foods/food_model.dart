import 'package:calory_tool/data/models/foods/food_allergen_model.dart';
import 'package:calory_tool/data/models/foods/food_preference_model.dart';
import 'package:calory_tool/data/models/foods/food_serving_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'food_model.g.dart';

@HiveType(typeId: 0)
class FoodModel extends HiveObject {
  FoodModel({
    required this.subCategories,
    required this.allergens,
    required this.preferences,
    required this.servings,
    this.id,
    this.name,
    this.brandName,
    this.type,
    this.url,
    this.imageUrl,
    this.amount = 0,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    final subCategories = json['sub_categories'] as List? ?? [];
    final allergens = json['allergens'] as List? ?? [];
    final preferences = json['preferences'] as List? ?? [];
    final servings = json['servings'] as List? ?? [];

    return FoodModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      brandName: json['brand_name'] as String?,
      type: json['type'] as String?,
      subCategories: subCategories.map((e) => e as String).toList(),
      url: json['url'] as String?,
      allergens:
          allergens
              .map((e) => FoodAllergenModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      preferences:
          preferences
              .map(
                (e) => FoodPreferenceModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      servings:
          servings
              .map((e) => FoodServingModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      imageUrl: json['image_url'] as String?,
    );
  }

  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? brandName;

  @HiveField(3)
  final String? type;

  @HiveField(4)
  final List<String> subCategories;

  @HiveField(5)
  final String? url;

  @HiveField(6)
  final List<FoodAllergenModel> allergens;

  @HiveField(7)
  final List<FoodPreferenceModel> preferences;

  @HiveField(8)
  final List<FoodServingModel> servings;

  @HiveField(9)
  final String? imageUrl;

  @HiveField(10)
  int amount;

  FoodModel clone() {
    return FoodModel(
      id: id,
      name: name,
      brandName: brandName,
      type: type,
      subCategories: List<String>.from(subCategories),
      url: url,
      allergens: List<FoodAllergenModel>.from(allergens),
      preferences: List<FoodPreferenceModel>.from(preferences),
      servings: List<FoodServingModel>.from(servings),
      imageUrl: imageUrl,
      amount: amount,
    );
  }
}
