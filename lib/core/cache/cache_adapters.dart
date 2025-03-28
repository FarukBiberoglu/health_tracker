part of 'cache_manager.dart';

class _CacheAdapters {
  _CacheAdapters._init();
  static final _CacheAdapters _instance = _CacheAdapters._init();
  static _CacheAdapters get I => _instance;

  void initAdapters() {
    Hive
      ..registerAdapter(FoodAllergenModelAdapter())
      ..registerAdapter(FoodCategoryModelAdapter())
      ..registerAdapter(FoodEatenModelAdapter())
      ..registerAdapter(FoodImageRecognitionModelAdapter())
      ..registerAdapter(FoodModelAdapter())
      ..registerAdapter(FoodNutritionalContentModelAdapter())
      ..registerAdapter(FoodPreferenceModelAdapter())
      ..registerAdapter(FoodSearchModelAdapter())
      ..registerAdapter(FoodServingModelAdapter())
      ..registerAdapter(FoodSuggestedServingModelAdapter())
      ..registerAdapter(RecipeModelAdapter())
      ..registerAdapter(RecipeNutritionModelAdapter())
      ..registerAdapter(RecipeSearchModelAdapter())
      ..registerAdapter(FoodCacheModelAdapter())
      ..registerAdapter(PlannedMealsEnumAdapter());
  }
}
