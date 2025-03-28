part of '../summary_page_imports.dart';

class _SummaryPageMealItem extends StatefulWidget {
  const _SummaryPageMealItem({
    required this.foods,
    required this.plannedMeal,
    required this.date,
  });

  final List<FoodModel> foods;
  final PlannedMealsEnum plannedMeal;
  final DateTime date;

  @override
  State<_SummaryPageMealItem> createState() => _SummaryPageMealItemState();
}

class _SummaryPageMealItemState extends State<_SummaryPageMealItem> {
  final bool _expandedMeals = false;

  @override
  Widget build(BuildContext context) {
    return MealCard(
      foods: widget.foods,
      plannedMeal: widget.plannedMeal,
      date: widget.date,
    );
  }
}
