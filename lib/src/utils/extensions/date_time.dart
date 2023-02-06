import 'package:intl/intl.dart';

extension BasicDateTimeExtension on DateTime {
  String differenceFrom(DateTime from, {bool isCompact = true}) {
    var fromTime = from.subtract(const Duration(seconds: 2));
    var duration = difference(fromTime);
    final days = duration.inDays > 0 ? "${duration.inDays}d" : "";
    duration = duration - Duration(days: duration.inDays);
    final hours = duration.inHours > 0 ? "${duration.inHours}h" : "";
    duration = duration - Duration(hours: duration.inHours);
    final minutes =
        duration.inMinutes > 0 && !(days != "" && isCompact) ? "${duration.inMinutes}m" : "";
    duration = duration - Duration(minutes: duration.inMinutes);
    final seconds = duration.inSeconds > 0 && !((days != "" || hours != "") && isCompact)
        ? "${duration.inSeconds}s"
        : "";

    return "$days$hours$minutes$seconds";
  }

  /// 2022-07-12T09:37:01.2830000Z ---> EEEE
  String get dayOfWeek => DateFormat('EEEE').format(this);

  /// 2022-07-12T09:37:01.2830000Z ---> 09:37
  String get timeStr => DateFormat('HH:mm').format(this);

  /// 2022-07-12T09:37:01.2830000Z ---> 12/07/2022 09:37
  String get dateAndTimeStr => DateFormat('dd/MM/yyyy HH:mm').format(this);

  /// 2022-07-12T09:37:01.2830000Z ---> 12/07 09:37
  String get shortDateAndTimeStr => DateFormat('dd/MM HH:mm').format(this);
}
