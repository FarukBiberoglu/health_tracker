import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/data/models/recipes/recipe_model.dart';
import 'package:calory_tool/presentation/pages/favorites/favorites_page_imports.dart';
import 'package:calory_tool/presentation/pages/food/food_page.dart';
import 'package:calory_tool/presentation/pages/food_detail_page/food_detail_page.dart';
import 'package:calory_tool/presentation/pages/home/home_page.dart';
import 'package:calory_tool/presentation/pages/info/info_page.dart';
import 'package:calory_tool/presentation/pages/main/main_page.dart';
import 'package:calory_tool/presentation/pages/recipe_details/recipe_details_page_imports.dart';
import 'package:calory_tool/presentation/pages/recipes/recipes_page.dart';
import 'package:calory_tool/presentation/pages/summary/summary_page_imports.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.custom(transitionsBuilder: TransitionsBuilders.fadeIn);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: RecipesRoute.page),
    AutoRoute(page: SummaryRoute.page),
    AutoRoute(page: FoodRoute.page),
    AutoRoute(page: RecipeDetailsRoute.page),
    AutoRoute(page: FavoritesRoute.page),
    AutoRoute(page: FoodDetailRoute.page),
    AutoRoute(page: InfoRoute.page),
  ];

  @override
  List<AutoRouteGuard> get guards => [];
}
