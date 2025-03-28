part of 'main_theme.dart';

mixin MainThemeElevatedButtonTheme implements MainThemeAppColorsMixin {
  ElevatedButtonThemeData elevatedButtonTheme(bool isDark) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) =>
                states.contains(WidgetState.disabled)
                    ? colors.grey
                    : colors.background.byBrightness(!isDark),
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) =>
                states.contains(WidgetState.disabled)
                    ? colors.grey.onColor.withValues(alpha: 0.4)
                    : colors.background.byBrightness(!isDark).onColor,
          ),
        ),
      );
}
