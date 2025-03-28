import 'package:calory_tool/core/cache/cache_manager.dart';
import 'package:calory_tool/core/models/food_cache_model.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/data/models/foods/food_search_model.dart';
import 'package:calory_tool/data/params/fatsecret_api_search_food_params.dart';
import 'package:calory_tool/data/repositories/fatsecret_api_repo.dart';
import 'package:calory_tool/enum/planned_meals_enum.dart';
import 'package:calory_tool/injections/injection.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

final class FoodProvider extends ChangeNotifier {
  FoodSearchModel? foods;
  bool isLoading = false;

  final List<FoodCacheModel> sevenDaysFoods = [];

  void init() {
    _checkSevenDaysFoods();
    notifyListeners();
  }

  void _checkSevenDaysFoods() {
    sevenDaysFoods.clear();

    for (var i = 0; i < 7; i++) {
      final food = CacheManager.I.dailyFoods.getDailyFoods(
        DateTime.now().subtract(Duration(days: i)),
      );
      sevenDaysFoods.add(food);
    }
  }

  Future<void> fetchsearchfoods(String query) async {
    isLoading = true;
    notifyListeners();
    final res = await Injection.I.read<FatsecretApiRepo>().searchFood(
      FatsecretApiSearchFoodParams(query: query),
    );
    res.when(
      onSuccess: (data) {
        foods = data;
      },
      onFail: (fail) {
        showToast(fail.error.message);
      },
    );
    isLoading = false;

    notifyListeners();
  }

  void clearFoods() {
    foods = null;
    notifyListeners();
  }

  Future<void> addSevenDaysFood(
    FoodModel food,
    PlannedMealsEnum mealType,
  ) async {
    await CacheManager.I.dailyFoods.addFood(food, mealType, DateTime.now());

    _checkSevenDaysFoods();
    notifyListeners();
  }

  Future<void> removeSevenDaysFood(
    String foodId,
    PlannedMealsEnum mealType,
    DateTime date,
  ) async {
    await CacheManager.I.dailyFoods.removeFood(foodId, mealType, date);

    _checkSevenDaysFoods();
    notifyListeners();
  }
}
