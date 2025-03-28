part of 'recipe_details_page_imports.dart';

class _RecipeDetailsPageView extends StatelessWidget {
  const _RecipeDetailsPageView({required this.recipeModel});
  final RecipeModel recipeModel ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: _RecipeDetailsPageBody(recipeModel:recipeModel));
  }
}
