// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [FavoritesPage]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoritesPage();
    },
  );
}

/// generated route for
/// [FoodDetailPage]
class FoodDetailRoute extends PageRouteInfo<FoodDetailRouteArgs> {
  FoodDetailRoute({
    required FoodModel foodModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FoodDetailRoute.name,
          args: FoodDetailRouteArgs(
            foodModel: foodModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FoodDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FoodDetailRouteArgs>();
      return FoodDetailPage(
        foodModel: args.foodModel,
        key: args.key,
      );
    },
  );
}

class FoodDetailRouteArgs {
  const FoodDetailRouteArgs({
    required this.foodModel,
    this.key,
  });

  final FoodModel foodModel;

  final Key? key;

  @override
  String toString() {
    return 'FoodDetailRouteArgs{foodModel: $foodModel, key: $key}';
  }
}

/// generated route for
/// [FoodPage]
class FoodRoute extends PageRouteInfo<void> {
  const FoodRoute({List<PageRouteInfo>? children})
      : super(
          FoodRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FoodPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [InfoPage]
class InfoRoute extends PageRouteInfo<void> {
  const InfoRoute({List<PageRouteInfo>? children})
      : super(
          InfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InfoPage();
    },
  );
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [RecipeDetailsPage]
class RecipeDetailsRoute extends PageRouteInfo<RecipeDetailsRouteArgs> {
  RecipeDetailsRoute({
    required RecipeModel recipeModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RecipeDetailsRoute.name,
          args: RecipeDetailsRouteArgs(
            recipeModel: recipeModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RecipeDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipeDetailsRouteArgs>();
      return RecipeDetailsPage(
        recipeModel: args.recipeModel,
        key: args.key,
      );
    },
  );
}

class RecipeDetailsRouteArgs {
  const RecipeDetailsRouteArgs({
    required this.recipeModel,
    this.key,
  });

  final RecipeModel recipeModel;

  final Key? key;

  @override
  String toString() {
    return 'RecipeDetailsRouteArgs{recipeModel: $recipeModel, key: $key}';
  }
}

/// generated route for
/// [RecipesPage]
class RecipesRoute extends PageRouteInfo<void> {
  const RecipesRoute({List<PageRouteInfo>? children})
      : super(
          RecipesRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecipesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RecipesPage();
    },
  );
}

/// generated route for
/// [SummaryPage]
class SummaryRoute extends PageRouteInfo<void> {
  const SummaryRoute({List<PageRouteInfo>? children})
      : super(
          SummaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SummaryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SummaryPage();
    },
  );
}
