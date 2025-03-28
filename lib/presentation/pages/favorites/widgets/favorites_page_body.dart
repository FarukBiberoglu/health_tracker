part of '../favorites_page_imports.dart';

class _FavoritesPageBody extends StatelessWidget {
  const _FavoritesPageBody();

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: SingleChildScrollView(

        child: Padding(
          padding: AppValues.xl.ext.padding.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Favorites',
                    style: context.ext.theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final filter = await showModalBottomSheet<
                          FavoriteCategory
                      >(
                        context: context,
                        builder: (_) => const _FavoritesPageFilterSheet(),
                      );

                      if (filter != null) {
                        FavoritesPage._viewModel.setTypeFilter(filter);
                      }
                    },
                    icon: const Icon(Icons.filter_list),
                  ),
                ],
              ),
              const _FavoritesPageSearchField(),
              AppValues.xl6.ext.sizedBox.vertical,
              const _FavoritesPageList(),
            ],
          ),
        ),
      ),
    );
  }
}
