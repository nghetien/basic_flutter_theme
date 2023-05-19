import 'package:shared_preferences/shared_preferences.dart';

import 'prefs_service_abstract.dart';

class PrefsServiceImpl implements PrefsService {
  late final SharedPreferences _prefs;

  @override
  Future<PrefsService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  @override
  Future<bool> setString(String key, String value) => _prefs.setString(key, value);

  @override
  Future<bool> setBool(String key, bool value) => _prefs.setBool(key, value);

  @override
  Future<bool> setList(String key, List<String> values) => _prefs.setStringList(key, values);

  @override
  String getString(String key) => _prefs.getString(key) ?? '';

  @override
  bool getBool(String key) => _prefs.getBool(key) ?? false;

  @override
  List<String> getList(String key) => _prefs.getStringList(key) ?? [];

  @override
  Future<bool> remove(String key) => _prefs.remove(key);

  @override
  Future<bool> clear() => _prefs.clear();

  @override
  Map<String, dynamic> get allPrefs => _prefs.getKeys().fold<Map<String, dynamic>>(
        {},
        (Map<String, dynamic> previousValue, String element) {
          previousValue[element] = _prefs.get(element);
          return previousValue;
        },
      );
}
