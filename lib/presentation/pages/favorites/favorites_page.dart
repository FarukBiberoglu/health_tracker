part of 'favorites_page_imports.dart';

@RoutePage()
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static final _viewModel = FavoritesPageViewModel();

  @override
  Widget build(BuildContext context) {
    return const _FavoritesPageView();

  }
}
