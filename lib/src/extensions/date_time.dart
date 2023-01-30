import 'package:intl/intl.dart';

extension BasicDateTimeExtension on DateTime {
  /// 2022-07-12T09:37:01.2830000Z ---> EEEE
  String get dayOfWeek => DateFormat('EEEE').format(this);

  /// 2022-07-12T09:37:01.2830000Z ---> 09:37
  String get timeStr => DateFormat('HH:mm').format(this);

  /// 2022-07-12T09:37:01.2830000Z ---> 12/07/2022 09:37
  String get dateAndTimeStr => DateFormat('dd/MM/yyyy HH:mm').format(this);

  /// 2022-07-12T09:37:01.2830000Z ---> 12/07 09:37
  String get shortDateAndTimeStr => DateFormat('dd/MM HH:mm').format(this);
}