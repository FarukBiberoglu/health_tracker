import 'package:calory_tool/core/cache/cache_manager.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/data/models/recipes/recipe_model.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<RecipeModel> recipe = [];
  final List<FoodModel> foods = [];

  void init() {
    recipe
      ..clear()
      ..addAll(CacheManager.I.favorite.getFavoriteRecipes);

    foods
      ..clear()
      ..addAll(CacheManager.I.favorite.getFavoriteFoods);

    notifyListeners();
  }

  void toogleFavoriteFood(FoodModel foodmodel) {
    if (foods.any((e) => e.id == foodmodel.id)) {
      foods.removeWhere((e) => e.id == foodmodel.id);
    } else {
      foods.add(foodmodel);
    }

    CacheManager.I.favorite.toggleFavoriteFood(foodmodel);
    notifyListeners();
  }

  void toogleFavoriteRecipe(RecipeModel recipeModel) {
    if (recipe.any((e) => e.id == recipeModel.id)) {
      recipe.removeWhere((e) => e.id == recipeModel.id);
    } else {
      recipe.add(recipeModel);
    }

    CacheManager.I.favorite.toggleFavoriteRecipe(recipeModel);
    notifyListeners();
  }
}
