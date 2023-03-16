part of 'calendar.dart';

class BasicCalendarDataSource<T> extends CalendarDataSource<T> {
  BasicCalendarDataSource({
    required List<BasicMeetingModel<T>> source,
    List<CalendarResource>? resourceColl,
  }) {
    appointments = source;
    if (resourceColl != null && resourceColl.isNotEmpty) resources = resourceColl;
  }

  @override
  String? getStartTimeZone(int index) => appointments![index].startTimeZone;

  @override
  String? getEndTimeZone(int index) => appointments![index].endTimeZone;

  @override
  String? getRecurrenceRule(int index) => appointments![index].recurrenceRule;

  @override
  bool isAllDay(int index) => appointments![index].isAllDay;

  @override
  String? getNotes(int index) => appointments![index].notes;

  @override
  String? getLocation(int index) => appointments![index].location;

  @override
  List<Object>? getResourceIds(int index) => appointments![index].resourceIds;

  @override
  Object? getRecurrenceId(int index) => appointments![index].recurrenceId;

  @override
  Object? getId(int index) => appointments![index].id;

  @override
  DateTime getStartTime(int index) => appointments![index].startTime;

  @override
  DateTime getEndTime(int index) => appointments![index].endTime;

  @override
  String getSubject(int index) => appointments![index].subject;

  @override
  Color getColor(int index) => appointments![index].color;

  @override
  List<DateTime>? getRecurrenceExceptionDates(int index) =>
      appointments![index].recurrenceExceptionDates;
}
