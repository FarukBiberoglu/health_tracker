part of '../favorites_page_imports.dart';

class _FavoritesPageFilterSheet extends StatelessWidget {
  const _FavoritesPageFilterSheet();

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:
          FavoriteCategory.values
                  .map(
                    (filter) => ListTile(
                      title: Text(filter.displayName),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () {
                        context.router.popForced(filter);
                      },
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
