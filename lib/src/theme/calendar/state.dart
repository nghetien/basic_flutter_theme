part of 'calendar.dart';

class BasicCalendarState<T>{
  BasicCalendarState({
    required this.source,
    this.resourceColl,
  });

  List<BasicMeetingModel<T>> source;
  List<CalendarResource>? resourceColl;
}