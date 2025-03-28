import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/data/models/foods/food_serving_model.dart';
import 'package:calory_tool/presentation/pages/food_detail_page/serving/serving_filter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class FoodDetailPageServing extends StatefulWidget {
  const FoodDetailPageServing({required this.foodServingModel, super.key});

  final List<FoodServingModel> foodServingModel;

  @override
  State<FoodDetailPageServing> createState() => _FoodDetailPageServingState();
}

class _FoodDetailPageServingState extends State<FoodDetailPageServing> {
  late FoodServingModel selectedServingType = widget.foodServingModel.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: AppValues.sm.value,
            children: [
              Expanded(
                child: Text(
                  selectedServingType.description ?? 'N/A',
                  style:TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton.filled(
                color: context.appThemeExt.appColors.primary,
                iconSize: 20,
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.all(5),
                icon: Icon(
                  Icons.filter_alt_rounded,
                  color: context.appThemeExt.appColors.primary.onColor,
                ),
                onPressed: () async {
                  final id = await showModalBottomSheet<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return ServingFilterSheet(
                        servingModels: widget.foodServingModel,
                      );
                    },
                  );
                  if (id != null) {
                    setState(() {
                      selectedServingType = widget.foodServingModel.firstWhere(
                        (element) => element.id == id,
                      );
                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          _servingTile(
            title: 'Calories',
            value: selectedServingType.calories.toString(),
            unit: 'kcal',
          ),
          _servingTile(
            title: 'Carbohydrates',
            value: selectedServingType.carbohydrate.toString(),
            unit: 'g',
          ),
          _servingTile(
            title: 'Protein',
            value: selectedServingType.protein.toString(),
            unit: 'g',
          ),
          _servingTile(
            title: 'Fat',
            value: selectedServingType.fat.toString(),
            unit: 'g',
          ),
          _servingTile(
            title: 'Saturated Fat',
            value: selectedServingType.saturatedFat?.toString() ?? 'N/A',
            unit: 'g',
          ),
          _servingTile(
            title: 'Polyunsaturated Fat',
            value: selectedServingType.polyunsaturatedFat?.toString() ?? 'N/A',
            unit: 'g',
          ),
          _servingTile(
            title: 'Monounsaturated Fat',
            value: selectedServingType.monounsaturatedFat?.toString() ?? 'N/A',
            unit: 'g',
          ),
          _servingTile(
            title: 'Cholesterol',
            value: selectedServingType.cholesterol?.toString() ?? 'N/A',
            unit: 'mg',
          ),
          _servingTile(
            title: 'Sodium',
            value: selectedServingType.sodium?.toString() ?? 'N/A',
            unit: 'mg',
          ),
          _servingTile(
            title: 'Potassium',
            value: selectedServingType.potassium?.toString() ?? 'N/A',
            unit: 'mg',
          ),
          _servingTile(
            title: 'Fiber',
            value: selectedServingType.fiber?.toString() ?? 'N/A',
            unit: 'g',
          ),
          _servingTile(
            title: 'Sugar',
            value: selectedServingType.sugar?.toString() ?? 'N/A',
            unit: 'g',
          ),
          _servingTile(
            title: 'Added Sugars',
            value: selectedServingType.addedSugars?.toString() ?? 'N/A',
            unit: 'g',
          ),
          _servingTile(
            title: 'Vitamin D',
            value: selectedServingType.vitaminD?.toString() ?? 'N/A',
            unit: 'µg',
          ),
          _servingTile(
            title: 'Vitamin A',
            value: selectedServingType.vitaminA?.toString() ?? 'N/A',
            unit: 'µg',
          ),
          _servingTile(
            title: 'Vitamin C',
            value: selectedServingType.vitaminC?.toString() ?? 'N/A',
            unit: 'mg',
          ),
          _servingTile(
            title: 'Calcium',
            value: selectedServingType.calcium?.toString() ?? 'N/A',
            unit: 'mg',
          ),
          _servingTile(
            title: 'Iron',
            value: selectedServingType.iron?.toString() ?? 'N/A',
            unit: 'mg',
          ),
        ],
      ),
    );
  }

  Widget _servingTile({
    required String title,
    required String value,
    required String unit,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      title: Text(
        title, style: TextStyle(
        fontSize: 18,
        color: Colors.grey,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
      ),
      ),
      trailing: Text(
        '$value $unit',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }
}
