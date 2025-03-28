part of '../favorites_page_imports.dart';

class _FavoritesPageRecipeList extends StatelessWidget {
  const _FavoritesPageRecipeList();
  

  @override
  Widget build(BuildContext context) {
    final recipes = context.watch<FavoritesProvider>().recipe;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.ext.screen.width ~/ 180,
        crossAxisSpacing: AppValues.sm.value,
        mainAxisSpacing: AppValues.sm.value,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final item = recipes[index];
        return RecipeCard(recipeModel: item);
      },
    );
  }
}
