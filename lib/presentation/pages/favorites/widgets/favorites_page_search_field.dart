part of '../favorites_page_imports.dart';

class _FavoritesPageSearchField extends StatefulWidget {
  const _FavoritesPageSearchField();

  @override
  State<_FavoritesPageSearchField> createState() =>
      _FavoritesPageSearchFieldState();
}

class _FavoritesPageSearchFieldState extends State<_FavoritesPageSearchField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: _searchController,
      hintText: 'Search for your favorites',
      prefixIcon: const Icon(Icons.search),
    );
  }
}
