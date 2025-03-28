part of '../favorites_page_imports.dart';

class _FavoritesPageFoodList extends StatelessWidget {
  const _FavoritesPageFoodList();

  @override
  Widget build(BuildContext context) {
    final foods = context.watch<FavoritesProvider>().foods;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        final item = foods[index];

        return FoodCard(foodModel: item);
      },
    );
  }
}
