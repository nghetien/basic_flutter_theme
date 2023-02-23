import 'package:basic_flutter_theme/basic_flutter_theme.dart';

class BasicDynamicExtension {
  const BasicDynamicExtension._();

  static bool canParseToInt(dynamic value) {
    if (value is int) return true;
    try {
      int.parse(value);
      return true;
    } catch (e) {
      BasicLogger.errorLog("canParseToInt: $e");
      return false;
    }
  }

  static bool isPositiveNumber(dynamic value) {
    if (!canParseToInt(value)) return false;
    if (value is int) return value > 0;
    try {
      return int.parse(value) > 0;
    } catch (e) {
      BasicLogger.errorLog("isPositiveNumber: $e");
      return false;
    }
  }
}
