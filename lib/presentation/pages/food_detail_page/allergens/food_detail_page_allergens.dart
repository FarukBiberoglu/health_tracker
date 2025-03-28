import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/data/models/foods/food_allergen_model.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class FoodDetailPageAllergens extends StatelessWidget {
  const FoodDetailPageAllergens({required this.foodAllergens, super.key});

  final List<FoodAllergenModel> foodAllergens;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:
          foodAllergens.map((foodAllergen) {
            return ListTile(
              title: Text(
                foodAllergen.name ?? 'N/A',
                style: context.ext.theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                foodAllergen.value == null
                    ? 'Unknown'
                    : foodAllergen.value!
                    ? 'Yes'
                    : 'No',
                style: context.ext.theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      foodAllergen.value == null
                          ? context.appThemeExt.appColors.grey
                          : foodAllergen.value!
                          ? context.appThemeExt.appColors.success.light
                          : context.appThemeExt.appColors.error.light,
                ),
              ),
            );
          }).toList(),
    );
  }
}
