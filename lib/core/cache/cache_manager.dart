import 'package:calory_tool/core/configs/enums/app_localiaztions_enum.dart';
import 'package:calory_tool/core/configs/enums/app_themes_enum.dart';
import 'package:calory_tool/core/models/food_cache_model.dart';
import 'package:calory_tool/data/models/foods/food_allergen_model.dart';
import 'package:calory_tool/data/models/foods/food_category_model.dart';
import 'package:calory_tool/data/models/foods/food_eaten_model.dart';
import 'package:calory_tool/data/models/foods/food_image_recognition_model.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/data/models/foods/food_nutritional_content_model.dart';
import 'package:calory_tool/data/models/foods/food_preference_model.dart';
import 'package:calory_tool/data/models/foods/food_search_model.dart';
import 'package:calory_tool/data/models/foods/food_serving_model.dart';
import 'package:calory_tool/data/models/foods/food_suggested_serving_model.dart';
import 'package:calory_tool/data/models/recipes/recipe_model.dart';
import 'package:calory_tool/data/models/recipes/recipe_nutrition_model.dart';
import 'package:calory_tool/data/models/recipes/recipe_search_model.dart';
import 'package:calory_tool/enum/planned_meals_enum.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:penta_core/penta_core.dart';

part 'cache_adapters.dart';
part 'user_configs_cache.dart';
part 'favorite_cache.dart';
part 'daily_foods_cache.dart';

final class CacheManager {
  CacheManager._init();
  static final CacheManager _instance = CacheManager._init();
  static CacheManager get I => _instance;

  _UserConfigsCache get userConfigs => _UserConfigsCache.I;
  _FavoriteCache get favorite => _FavoriteCache.I;
  _DailyFoodsCache get dailyFoods => _DailyFoodsCache.I;

  Future<void> init() async {
    await Hive.initFlutter();
    _CacheAdapters.I.initAdapters();
    await userConfigs._init();
    await favorite._init();
    await dailyFoods._init();
  }

  Future<void> clear() async {
    await Hive.deleteFromDisk();
  }
}
