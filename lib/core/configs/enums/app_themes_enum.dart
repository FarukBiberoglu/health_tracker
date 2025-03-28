import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:calory_tool/core/configs/theme/themes/main/main_theme.dart';
import 'package:penta_core/penta_core.dart';

enum AppThemesEnum {
  main(value: 'main', displayName: 'Main');

  const AppThemesEnum({required this.value, required this.displayName});

  final String value;
  final String displayName;

  IAppTheme get theme {
    return switch (this) {
      AppThemesEnum.main => MainTheme(),
    };
  }

  static AppThemesEnum fromString(String value) {
    return AppThemesEnum.values.ext.where.firstOrNull(
          (element) => element.value == value,
        ) ??
        AppThemesEnum.main;
  }
}
