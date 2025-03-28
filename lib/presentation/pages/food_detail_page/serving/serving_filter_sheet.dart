import 'package:auto_route/auto_route.dart';
import 'package:calory_tool/data/models/foods/food_serving_model.dart';
import 'package:flutter/material.dart';

class ServingFilterSheet extends StatefulWidget {
  const ServingFilterSheet({required this.servingModels, super.key});

  final List<FoodServingModel> servingModels;

  @override
  State<ServingFilterSheet> createState() => _ServingFilterSheetState();
}

class _ServingFilterSheetState extends State<ServingFilterSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children:
            widget.servingModels
                .map(
                  (e) => ListTile(
                    onTap: () => context.router.popForced(e.id),
                    title: Text(e.description ?? 'N/A'),
                  ),
                )
                .toList(),
      ),
    );
  }
}
