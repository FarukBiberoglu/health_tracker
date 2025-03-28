part of 'cache_manager.dart';

final class _DailyFoodsCache {
  _DailyFoodsCache._init();
  static final _DailyFoodsCache _instance = _DailyFoodsCache._init();
  static _DailyFoodsCache get I => _instance;

  late final Box<FoodCacheModel> _dailyFoodsBox;

  final String _dailyFoodsName = 'dailyFoods';

  Future<void> _init() async {
    _dailyFoodsBox = await Hive.openBox(_dailyFoodsName);
  }

  FoodCacheModel getDailyFoods(DateTime date) {
    final foods = _dailyFoodsBox.get(
      DateFormat('yyyy-MM-dd').format(date.toUtc()),
    );

    return foods ?? FoodCacheModel.empty(date.toLocal());
  }

  Future<void> addFood(
    FoodModel food,
    PlannedMealsEnum type,
    DateTime date,
  ) async {
    final foods = getDailyFoods(date);
    final cloneFood = food.clone();

    foods.foodEntries.putIfAbsent(type, () => []);

    final foodExist = foods.foodEntries[type]!.ext.where.firstOrNull(
      (e) => e.id == food.id,
    );
    if (foodExist == null) {
      cloneFood.amount = 1;
      foods.foodEntries[type]!.add(cloneFood);
    } else {
      ++foodExist.amount;
    }

    await _dailyFoodsBox.put(
      DateFormat('yyyy-MM-dd').format(date.toUtc()),
      foods,
    );
  }

  Future<void> removeFood(
    String foodId,
    PlannedMealsEnum type,
    DateTime date,
  ) async {
    final foods = getDailyFoods(date);

    final hasFood = foods.foodEntries[type]!.any((e) => e.id == foodId);
    if (hasFood) {
      if (foods.foodEntries[type]!.any((e) => e.amount <= 1)) {
        foods.foodEntries[type]!.removeWhere((e) => e.id == foodId);
      } else {
        --foods.foodEntries[type]!
            .firstWhere((element) => element.id == foodId)
            .amount;
      }
    }

    await _dailyFoodsBox.put(
      DateFormat('yyyy-MM-dd').format(date.toUtc()),
      foods,
    );
  }
}
