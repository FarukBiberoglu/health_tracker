import 'package:calory_tool/app.dart';
import 'package:calory_tool/core/cache/cache_manager.dart';
import 'package:calory_tool/core/configs/constants/app_environments.dart';
import 'package:calory_tool/core/providers/favorite_provider.dart';
import 'package:calory_tool/core/providers/food_provider.dart';
import 'package:calory_tool/core/providers/reciper_provider.dart';
import 'package:calory_tool/core/providers/theme_notifier.dart';
import 'package:calory_tool/injections/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //~ Initialize Dependencies
  await AppEnvironments.I.init();
  //await EasyLocalization.ensureInitialized();

  //~ Initialize Instances
  Injection.I.init();
  await CacheManager.I.init();

  //~ Initialize Providers
  // final localizationNotifier = LocalizationNotifier();

  final themeNotifier = ThemeNotifier();
  await themeNotifier.init();

  final favoritesProvider = FavoritesProvider()..init();
  final foodProvider = FoodProvider()..init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => favoritesProvider),
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
        ChangeNotifierProvider(create: (_) => themeNotifier),
        ChangeNotifierProvider(create: (_) => foodProvider),
      ],
      child: const MyApp(),
    ),
  );
}
