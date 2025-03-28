import 'package:hive_flutter/hive_flutter.dart';

part 'planned_meals_enum.g.dart';

@HiveType(typeId: 13)
enum PlannedMealsEnum {
  @HiveField(0)
  breakfast(displayName: 'Breakfast', imagePath: 'assets/gif/croissant.gif'),
  @HiveField(1)
  lunch(displayName: 'Lunch', imagePath: 'assets/gif/pasta.gif'),
  @HiveField(2)
  dinner(displayName: 'Dinner', imagePath: 'assets/gif/dinner.gif'),
  @HiveField(3)
  snacks(displayName: 'Snacks', imagePath: 'assets/gif/snack.gif');

  const PlannedMealsEnum({required this.displayName, required this.imagePath});

  final String displayName;
  final String imagePath;
}
