import 'package:calory_tool/core/cache/cache_manager.dart';
import 'package:calory_tool/core/configs/enums/app_themes_enum.dart';
import 'package:flutter/material.dart';

final class ThemeNotifier extends ChangeNotifier {
  AppThemesEnum _currentTheme = AppThemesEnum.main;
  ThemeMode _currentThemeMode = ThemeMode.system;

  AppThemesEnum get currentTheme => _currentTheme;
  ThemeMode get currentThemeMode => _currentThemeMode;

  Future<void> init() async {
    _currentTheme = CacheManager.I.userConfigs.theme;
    _currentThemeMode = CacheManager.I.userConfigs.themeMode;
    notifyListeners();
  }

  void setTheme(AppThemesEnum theme) {
    _currentTheme = theme;
    CacheManager.I.userConfigs.saveTheme(theme);
    notifyListeners();
  }

  void setThemeMode(ThemeMode themeMode) {
    _currentThemeMode = themeMode;
    CacheManager.I.userConfigs.saveThemeMode(themeMode);
    notifyListeners();
  }

  void updateSystemThemeMode() {
    if (_currentThemeMode == ThemeMode.system) {
      notifyListeners();
    }
  }
}
