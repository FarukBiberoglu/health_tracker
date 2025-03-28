import 'package:calory_tool/core/configs/theme/app_colors.dart';
import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

part 'main_theme_app_bar_theme_mixin.dart';
part 'main_theme_app_colors_mixin.dart';
part 'main_theme_chip_theme_mixin.dart';
part 'main_theme_elevated_button_theme.dart';
part 'main_theme_text_theme_mixin.dart';

final class MainTheme extends IAppTheme
    with
        MainThemeAppColorsMixin,
        MainThemeTextThemeMixin,
        MainThemeAppBarThemeMixin,
        MainThemeElevatedButtonTheme,
        MainThemeChipTheme {
  @override
  ThemeData getThemeData(bool isDark) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: colors.primary,
      scaffoldBackgroundColor: colors.background.byBrightness(isDark),
      textTheme: textTheme(isDark),
      appBarTheme: appBarTheme,
      elevatedButtonTheme: elevatedButtonTheme(isDark),
      chipTheme: chipTheme(isDark),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: colors.primary.withValues(alpha: 0.1),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: colors.background.byBrightness(isDark),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: colors.primary.withValues(alpha: 0.1),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: colors.primary,
        inactiveTrackColor: colors.grey.withValues(alpha: 0.5),
        thumbColor: colors.primary,
        overlayColor: colors.primary.withValues(alpha: 0.5),
        thumbSize: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.dragged)) {
            return const Size.square(20);
          }
          if (states.contains(WidgetState.disabled)) {
            return const Size.square(5);
          }
          return const Size.square(15);
        }),
      ),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.all(3)),
          visualDensity: VisualDensity.standard,
        ),
      ),
    );
  }
}
