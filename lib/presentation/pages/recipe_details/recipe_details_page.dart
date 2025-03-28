part of 'recipe_details_page_imports.dart';

@RoutePage()
class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({required this.recipeModel, super.key});
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return _RecipeDetailsPageView(recipeModel: recipeModel);
  }
}
