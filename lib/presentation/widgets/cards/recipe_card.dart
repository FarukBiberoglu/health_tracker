import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/core/providers/favorite_provider.dart';
import 'package:calory_tool/core/router/app_router.dart';
import 'package:calory_tool/data/models/recipes/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({required this.recipeModel, super.key});

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    final theme = context.ext.theme;
    final colors = context.appThemeExt.appColors;
    final textColor = colors.white.byBrightness(theme.isDark).onColor;

    return GestureDetector(
      onTap: () {
        context.router.push(RecipeDetailsRoute(recipeModel: recipeModel));
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: recipeModel.image ?? '',
                height: 180,
                width: double.infinity,
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

              // Gradient Overlay
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withValues(alpha: 0.4),
                  child: IconButton(
                    onPressed: () {
                      context.read<FavoritesProvider>().toogleFavoriteRecipe(
                        recipeModel,
                      );
                    },
                    icon: Consumer<FavoritesProvider>(
                      builder: (context, favorites, _) {
                        final isFavorite = favorites.recipe.any(
                          (e) => e.id == recipeModel.id,
                        );
                        return Icon(
                          Icons.favorite_rounded,
                          color: isFavorite ? Colors.red : Colors.white,
                          size: 24,
                          shadows:
                              isFavorite ? [] : [const Shadow(blurRadius: 2)],
                        );
                      },
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 5,
                left: 10,
                right: 10,
                child: Text(
                  recipeModel.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
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
