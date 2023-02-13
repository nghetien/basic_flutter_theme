import 'package:intl/intl.dart';

class BasicDateTimeValidator {
  const BasicDateTimeValidator._();

  static bool isDateTime(
    String str, {
    String? validator,
  }) {
    try {
      if (validator != null) {
        DateFormat(validator).parse(str);
        return true;
      }
      DateTime.parse(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isTimeOfDay(String str) {
    try {
      final List<String> split = str.split(':');
      final int hour = int.parse(split[0]);
      final int minute = int.parse(split[1]);
      if (hour < 0 || hour > 23 || minute < 0 || minute > 59) return false;
      return true;
    } catch (e) {
      return false;
    }
  }
}
