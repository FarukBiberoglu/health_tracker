import 'package:calory_tool/data/models/recipes/recipe_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'recipe_search_model.g.dart';

@HiveType(typeId: 12)
class RecipeSearchModel extends HiveObject {
  RecipeSearchModel({required this.recipes, this.pageNumber});

  factory RecipeSearchModel.fromJson(Map<String, dynamic> json) {
    return RecipeSearchModel(
      pageNumber: (json['page_number'] as num?)?.toInt(),
      recipes:
          (json['recipes'] as List?)
              ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  @HiveField(0)
  final int? pageNumber;

  @HiveField(1)
  final List<RecipeModel> recipes;
}
