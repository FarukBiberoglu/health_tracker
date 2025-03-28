enum FavoriteCategory {
  recipes(displayName: 'Recipes'),
  foods(displayName: 'Foods');

  const FavoriteCategory({required this.displayName});

  final String displayName;
}
