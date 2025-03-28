part of 'cache_manager.dart';

final class _FavoriteCache {
  _FavoriteCache._init();
  static final _FavoriteCache _instance = _FavoriteCache._init();
  static _FavoriteCache get I => _instance;

  late final Box<List<dynamic>> _favoriteFoodsBox;
  late final Box<List<dynamic>> _favoriteRecipesBox;

  final String _favoriteFoodsName = 'favoriteFoods';
  final String _favoriteRecipesName = 'favoriteRecipes';

  Future<void> _init() async {
    _favoriteFoodsBox = await Hive.openBox(_favoriteFoodsName);
    _favoriteRecipesBox = await Hive.openBox(_favoriteRecipesName);
  }

  List<FoodModel> get getFavoriteFoods =>
      _favoriteFoodsBox.values.isEmpty
          ? <FoodModel>[]
          : _favoriteFoodsBox.values.first.map((e) => e as FoodModel).toList();

  List<RecipeModel> get getFavoriteRecipes =>
      _favoriteRecipesBox.values.isEmpty
          ? <RecipeModel>[]
          : _favoriteRecipesBox.values.first
              .map((e) => e as RecipeModel)
              .toList();

  void toggleFavoriteFood(FoodModel foodModel) {
    final foods = getFavoriteFoods;
    if (foods.any((e) => e.id == foodModel.id)) {
      foods.removeWhere((e) => e.id == foodModel.id);
    } else {
      foods.add(foodModel);
    }
    _favoriteFoodsBox.put(_favoriteFoodsName, foods);
  }

  void toggleFavoriteRecipe(RecipeModel recipeModel) {
    final recipes = getFavoriteRecipes;
    if (recipes.any((e) => e.id == recipeModel.id)) {
      recipes.removeWhere((e) => e.id == recipeModel.id);
    } else {
      recipes.add(recipeModel);
    }
    _favoriteRecipesBox.put(_favoriteRecipesName, recipes);
  }
}
