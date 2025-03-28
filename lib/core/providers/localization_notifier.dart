import 'package:calory_tool/core/cache/cache_manager.dart';
import 'package:calory_tool/core/configs/enums/app_localiaztions_enum.dart';
import 'package:flutter/material.dart';

final class LocalizationNotifier extends ChangeNotifier {
  AppLocaliaztionsEnum _appLang = AppLocaliaztionsEnum.enUS;

  AppLocaliaztionsEnum get appLang => _appLang;

  static List<Locale> get supportedLocales =>
      AppLocaliaztionsEnum.values.map((e) => e.locale).toList(growable: false);
  static Locale get fallbackLocale => AppLocaliaztionsEnum.enUS.locale;

  Future<void> init() async {
    final locale = CacheManager.I.userConfigs.language;
    _appLang = AppLocaliaztionsEnum.fromLocaleString(locale);
  }

  Future<void> setAppLang(AppLocaliaztionsEnum lang) async {
    _appLang = lang;
    await CacheManager.I.userConfigs.saveLanguage(lang);
    notifyListeners();
  }
}
