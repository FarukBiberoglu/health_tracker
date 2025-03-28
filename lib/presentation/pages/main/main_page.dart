import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/presentation/pages/favorites/favorites_page_imports.dart';
import 'package:calory_tool/presentation/pages/food/food_page.dart';
import 'package:calory_tool/presentation/pages/home/home_page.dart';
import 'package:calory_tool/presentation/pages/main/store/navigation_store.dart';
import 'package:calory_tool/presentation/pages/recipes/recipes_page.dart';
import 'package:calory_tool/presentation/pages/summary/summary_page_imports.dart';
import 'package:calory_tool/presentation/widgets/navBar/nav_bar_widget.dart';
import 'package:calory_tool/presentation/widgets/safearea/custom_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static final PageController pageController = PageController();

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<CustomBottomNavBarData> data = [
    CustomBottomNavBarData(
      icon: Icons.home,
      label: 'Home',
      page: const HomePage(),
    ),
    CustomBottomNavBarData(
      icon: Icons.fastfood,
      label: 'Food',
      page: const FoodPage(),
    ),
    CustomBottomNavBarData(
      icon: Icons.favorite,
      label: 'Favorites',
      page: const FavoritesPage(),
    ),
    CustomBottomNavBarData(
      icon: Icons.bar_chart,
      label: 'Summary',
      page: const SummaryPage(),
    ),
    CustomBottomNavBarData(
      icon: Icons.menu_book_rounded,
      label: 'Recipes',
      page: const RecipesPage(),
    ),
  ];


  static final NavigationStore _navigationStore = NavigationStore();

  @override
  void dispose() {
    MainPage.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomSafeArea(
        child: Observer(
          builder: (_) {
            return CustomBottomNavBar(
              data: data,
              selectedIndex: _navigationStore.selectedIndex,
              onTap: (index) {
                MainPage.pageController.animateToPage(
                  index,
                  duration: Durations.medium3,
                  curve: Curves.ease,
                );
              },
            );
          },
        ),
      ),
      body: CustomSafeArea(
        child: Observer(
          builder: (_) {
            return PageView(
              controller: MainPage.pageController,
              onPageChanged: _navigationStore.setIndex,
              children: data.map((e) => e.page).toList(),
            );
          },
        ),
      ),
    );
  }
}
