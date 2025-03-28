class FatsecretApiSearchRecipeParams {
  FatsecretApiSearchRecipeParams({required this.query});

  final String query;

  static const String queryKey = 'query';

  Map<String, dynamic> toMap() {
    return {queryKey: query};
  }
}
