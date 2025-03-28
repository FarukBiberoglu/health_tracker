import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:calory_tool/core/providers/favorite_provider.dart';
import 'package:calory_tool/data/models/foods/food_model.dart';
import 'package:calory_tool/presentation/pages/food_detail_page/allergens/food_detail_page_allergens.dart';
import 'package:calory_tool/presentation/pages/food_detail_page/preferences/food_detail_page_preferences.dart';
import 'package:calory_tool/presentation/pages/food_detail_page/serving/food_detail_page_serving.dart';
import 'package:calory_tool/presentation/widgets/safearea/custom_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({required this.foodModel, super.key});

  final FoodModel foodModel;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppValues.md.ext.padding.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBar(
                  title: Text(widget.foodModel.name ?? 'N/A'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.read<FavoritesProvider>().toogleFavoriteFood(
                          widget.foodModel,
                        );
                      },
                      icon: Icon(
                        context.watch<FavoritesProvider>().foods.any(
                              (e) => e.id == widget.foodModel.id,
                            )
                            ? Icons.favorite
                            : Icons.favorite_outline,
                      ),
                    ),
                  ],
                  centerTitle: true,
                ),
                Center(
                  child: SizedBox(
                    width: context.ext.screen.byOrientation(
                      portrait: context.ext.screen.width * 0.5,
                      landscape: context.ext.screen.height * 0.5,
                    ),
                    height: context.ext.screen.byOrientation(
                      portrait: context.ext.screen.width * 0.5,
                      landscape: context.ext.screen.height * 0.5,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: widget.foodModel.imageUrl ?? '',
                        errorWidget:
                            (context, error, stackTrace) => const ColoredBox(
                              color: Colors.grey,
                              child: Icon(
                                Icons.broken_image,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                      ),
                    ),
                  ),
                ),
                AppValues.md.ext.sizedBox.vertical,
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: AppValues.sm.value,
                  children: List.generate(
                    widget.foodModel.subCategories.length,
                    (index) {
                      final category = widget.foodModel.subCategories[index];
                      return Chip(label: Text(category));
                    },
                  ),
                ),
                AppValues.md.ext.sizedBox.vertical,
                if (widget.foodModel.brandName != null)
                  Text(
                    widget.foodModel.brandName!,
                    textAlign: TextAlign.center,
                    style: context.ext.theme.textTheme.bodyLarge,
                  ),
                AppValues.md.ext.sizedBox.vertical,

                // TabBar
                TabBar(
                  controller: _tabController,
                  onTap: (index) {
                    setState(() {});
                  },
                  tabs: const [
                    Tab(text: 'Serving'),
                    Tab(text: 'Allergens'),
                    Tab(text: 'Preferences'),
                  ],
                ),
                Builder(
                  builder: (context) {
                    return _tabController.index == 0
                        ? FoodDetailPageServing(
                          foodServingModel: widget.foodModel.servings,
                        )
                        : _tabController.index == 1
                        ? FoodDetailPageAllergens(
                          foodAllergens: widget.foodModel.allergens,
                        )
                        : FoodDetailPagePreferences(
                          foodPreferences: widget.foodModel.preferences,
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
