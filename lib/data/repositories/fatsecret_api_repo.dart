import 'package:calory_tool/data/datasources/fatsecret/fatsecret_remote_datasource.dart';
import 'package:calory_tool/data/models/foods/food_category_model.dart';
import 'package:calory_tool/data/models/foods/food_image_recognition_model.dart';
import 'package:calory_tool/data/models/foods/food_search_model.dart';
import 'package:calory_tool/data/models/recipes/recipe_search_model.dart';
import 'package:calory_tool/data/params/fatsecret_api_image_recognition_params.dart';
import 'package:calory_tool/data/params/fatsecret_api_search_food_params.dart';
import 'package:calory_tool/data/params/fatsecret_api_search_recipe_params.dart';
import 'package:calory_tool/injections/injection.dart';
import 'package:penta_core/penta_core.dart';

class FatsecretApiRepo {
  Future<ResponseModel<FoodSearchModel>> searchFood(
    FatsecretApiSearchFoodParams params,
  ) async {
    return Injection.I.read<FatsecretRemoteDatasource>().searchFood(params);
  }

  Future<ResponseModel<FoodCategoryModel>> getCategories() async {
    return Injection.I.read<FatsecretRemoteDatasource>().getCategories();
  }

  Future<ResponseModel<FoodImageRecognitionModel>> imageRecognition(
    FatsecretApiImageRecognitionParams params,
  ) async {
    return Injection.I.read<FatsecretRemoteDatasource>().imageRecognition(
      params,
    );
  }

  Future<ResponseModel<RecipeSearchModel>> searchRecipe(
    FatsecretApiSearchRecipeParams params,
  ) async {
    return Injection.I.read<FatsecretRemoteDatasource>().searchRecipe(params);
  }
}
