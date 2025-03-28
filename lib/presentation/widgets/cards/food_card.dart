import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/core/providers/favorite_provider.dart';
import 'package:calory_tool/core/providers/food_provider.dart';
import 'package:calory_tool/core/router/app_router.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/enum/planned_meals_enum.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({required this.foodModel, super.key});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    final theme = context.ext.theme;
    final colors = context.appThemeExt.appColors;
    final isFavorite = context.watch<FavoritesProvider>().foods.any(
      (e) => e.id == foodModel.id,
    );

    return GestureDetector(
      onTap: () {
        context.router.push(FoodDetailRoute(foodModel: foodModel));
      },
      child: Card(
        color: theme.isDark ? Colors.grey[900] : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            spacing: 8,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: foodModel.imageUrl ?? '',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorWidget:
                      (context, error, stackTrace) => const ColoredBox(
                        color: Colors.grey,
                        child: Icon(
                          Icons.broken_image,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                ),
              ),
              Expanded(
                child: Text(
                  foodModel.name ?? 'Unknown Food',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: theme.isDark ? Colors.white : Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<FavoritesProvider>().toogleFavoriteFood(
                    foodModel,
                  );
                },
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.grey.withValues(alpha: 0.3),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final mealType = await showModalBottomSheet<PlannedMealsEnum>(
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children:
                                PlannedMealsEnum.values
                                    .map((e) {
                                      return GestureDetector(
                                        onTap:
                                            () => context.router.popForced(e),
                                        child: ListTile(
                                          trailing: Icon(Icons.chevron_right),
                                          title: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: Text(
                                              e.displayName,
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black45,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                    .expand((e) => [e, Divider()])
                                    .toList()
                                  ..removeLast(),
                          ),
                        ),
                      );
                    },
                  );

                  if (mealType != null && context.mounted) {
                    await context.read<FoodProvider>().addSevenDaysFood(
                      foodModel,
                      mealType,
                    );
                  }
                },
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: context.appThemeExt.appColors.primary,
                  child: Icon(
                    Icons.add,
                    color: context.appThemeExt.appColors.primary.onColor,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
