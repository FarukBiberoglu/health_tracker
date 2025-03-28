part of 'cache_manager.dart';

final class _UserConfigsCache {
  _UserConfigsCache._init();
  static final _UserConfigsCache _instance = _UserConfigsCache._init();
  static _UserConfigsCache get I => _instance;

  late final Box<dynamic> _box;

  final String _boxName = 'user_configs';
  final String _isFirstTimeKey = 'is_first_time';
  final String _themeKey = 'theme';
  final String _themeModeKey = 'theme_mode';
  final String _languageKey = 'language';

  Future<void> _init() async {
    _box = await Hive.openBox(_boxName);
  }

  Future<void> saveIsFirstTime(bool isFirstTime) async {
    return _box.put(_isFirstTimeKey, isFirstTime);
  }

  bool get isFirstTime => _box.get(_isFirstTimeKey, defaultValue: true) as bool;
  AppThemesEnum get theme => AppThemesEnum.fromString(
    _box.get(_themeKey, defaultValue: AppThemesEnum.main.value) as String,
  );
  ThemeMode get themeMode =>
      ThemeMode.values[_box.get(
            _themeModeKey,
            defaultValue: ThemeMode.system.index,
          )
          as int];

  Future<void> saveTheme(AppThemesEnum theme) async {
    return _box.put(_themeKey, theme.value);
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    return _box.put(_themeModeKey, themeMode.index);
  }

  Future<void> saveLanguage(AppLocaliaztionsEnum lang) async {
    return _box.put(_languageKey, lang.localeString);
  }

  String get language =>
      _box.get(_languageKey, defaultValue: 'en_US') as String;
}
