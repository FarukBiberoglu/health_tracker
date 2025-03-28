part of '../favorites_page_imports.dart';

class _FavoritesPageList extends StatefulWidget {
  const _FavoritesPageList();

  @override
  State<_FavoritesPageList> createState() => _FavoritesPageListState();
}

class _FavoritesPageListState extends State<_FavoritesPageList> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return switch (FavoritesPage._viewModel.typeFilter) {
          FavoriteCategory.foods => const _FavoritesPageFoodList(),
          FavoriteCategory.recipes =>
            const _FavoritesPageRecipeList(),

        };
      },
    );
  }
}
