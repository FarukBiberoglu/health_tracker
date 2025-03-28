import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/core/providers/food_provider.dart';
import 'package:calory_tool/presentation/widgets/cards/food_card.dart';
import 'package:calory_tool/presentation/widgets/fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  late final PentaDebounceable<void, String> _fetchSuggestions =
      PentaDebouncer.debounce(
        debounceDuration: const Duration(milliseconds: 1000),
        function: (query) async {
          if (_searchText == query) return;
          _searchText = query;

          context.read<FoodProvider>().clearFoods();
          if (query.isEmpty) {
            return;
          }

          await context.read<FoodProvider>().fetchsearchfoods(query);
        },
      );

  @override
  Widget build(BuildContext context) {
    final items =
        context
            .watch<FoodProvider>()
            .foods
            ?.foods
            .where((e) => e.imageUrl != null)
            .toList();

    return Scaffold(
      backgroundColor: Colors.grey[200], // Sayfa arka planını hafif gri yaptık
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: CustomTextField(
                controller: _searchController,
                hintText: 'Search for recipes...',
                prefixIcon: const Icon(Icons.search),
                onChanged: _fetchSuggestions,
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                itemCount: items?.length ?? 0,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final food = items![index];
                  return FoodCard(foodModel: food);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
