part of 'main_theme.dart';

mixin MainThemeAppColorsMixin {
  AppColors get colors => AppColors(
    primary: OnColor(
      value: const Color(0xFF40B290),
      onColor: const Color(0xFFFBFBFB),
    ),
    secondary: OnColor(
      value: const Color(0xFF40B2A8),
      onColor: const Color(0xFFFBFBFB),
    ),
    background: BrightnessOnColor(
      light: OnColor(
        value: const Color(0xFFFBFBFB),
        onColor: const Color(0xFF1A1A1A),
      ),
      dark: OnColor(
        value: const Color(0xFF1A1A1A),
        onColor: const Color(0xFFFBFBFB),
      ),
    ),
    white: BrightnessOnColor(
      light: OnColor(
        value: const Color(0xFFFBFBFB),
        onColor: const Color(0xFF1A1A1A),
      ),
      dark: OnColor(
        value: const Color(0xFF1A1A1A),
        onColor: const Color(0xFFFBFBFB),
      ),
    ),
    black: BrightnessOnColor(
      light: OnColor(
        value: const Color(0xFF1A1A1A),
        onColor: const Color(0xFFFBFBFB),
      ),
      dark: OnColor(
        value: const Color(0xFFFBFBFB),
        onColor: const Color(0xFF1A1A1A),
      ),
    ),
    lightGrey: OnColor(
      value: const Color(0xFFE0E0E0),
      onColor: const Color(0xFF1A1A1A),
    ),
    grey: OnColor(
      value: const Color(0xFFBDBDBD),
      onColor: const Color(0xFF1A1A1A),
    ),
    darkGrey: OnColor(
      value: const Color(0xFF757575),
      onColor: const Color(0xFFFBFBFB),
    ),
    error: BrightnessOnColor(
      light: OnColor(
        value: const Color(0xFFD32F2F),
        onColor: const Color(0xFFFBFBFB),
      ),
      dark: OnColor(
        value: const Color(0xFFA21F1F),
        onColor: const Color(0xFFFBFBFB),
      ),
    ),
    success: BrightnessOnColor(
      light: OnColor(
        value: const Color(0xFF388E3C),
        onColor: const Color(0xFFFBFBFB),
      ),
      dark: OnColor(
        value: const Color(0xFF2E7D32),
        onColor: const Color(0xFFFBFBFB),
      ),
    ),
    warning: BrightnessOnColor(
      light: OnColor(
        value: const Color(0xFFFBC02D),
        onColor: const Color(0xFF1A1A1A),
      ),
      dark: OnColor(
        value: const Color(0xFFC39C00),
        onColor: const Color(0xFF1A1A1A),
      ),
    ),
    info: BrightnessOnColor(
      light: OnColor(
        value: const Color(0xFF1976D2),
        onColor: const Color(0xFFFBFBFB),
      ),
      dark: OnColor(
        value: const Color(0xFF1257A5),
        onColor: const Color(0xFFFBFBFB),
      ),
    ),
  );
}
