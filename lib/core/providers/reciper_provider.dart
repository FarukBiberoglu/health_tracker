import 'package:calory_tool/data/models/recipes/recipe_search_model.dart';
import 'package:calory_tool/data/params/fatsecret_api_search_recipe_params.dart';
import 'package:calory_tool/data/repositories/fatsecret_api_repo.dart';
import 'package:calory_tool/injections/injection.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

final class RecipeProvider extends ChangeNotifier {
  RecipeSearchModel? recipes ;
  bool isLoading = false;
  Future<void> fetchsearchRecipe(String query)async{
    isLoading=true;
    notifyListeners();
    final res=await Injection.I.read<FatsecretApiRepo>().searchRecipe(FatsecretApiSearchRecipeParams(query: query));
    res.when(onSuccess: (data) {
      recipes= data;
    }, onFail: (fail) {
      showToast(fail.error.message);
    },);
    isLoading=false;
    notifyListeners();

  }
  void clearRecipes(){
    recipes= null;
    notifyListeners();
  }

}
