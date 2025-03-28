part of 'main_theme.dart';

mixin MainThemeChipTheme implements MainThemeAppColorsMixin {
  ChipThemeData chipTheme(bool isDark) {
    return ChipThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      showCheckmark: false,
      color: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.grey.withValues(alpha: 0.5);
        }
        return colors.primary;
      }),
      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      secondaryLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
