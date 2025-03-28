import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/data/models/foods/food_preference_model.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class FoodDetailPagePreferences extends StatelessWidget {
  const FoodDetailPagePreferences({required this.foodPreferences, super.key});

  final List<FoodPreferenceModel> foodPreferences;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: foodPreferences.length,
      itemBuilder: (context, index) {
        final foodPreference = foodPreferences[index];
        return ListTile(
          title: Text(
            foodPreference.name ?? 'N/A',
            style: context.ext.theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Text(
            foodPreference.value == null
                ? 'Unknown'
                : foodPreference.value!
                ? 'Yes'
                : 'No',
            style: context.ext.theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color:
                  foodPreference.value == null
                      ? context.appThemeExt.appColors.grey
                      : foodPreference.value!
                      ? context.appThemeExt.appColors.success.light
                      : context.appThemeExt.appColors.error.light,
            ),
          ),
        );
      },
    );
  }
}
