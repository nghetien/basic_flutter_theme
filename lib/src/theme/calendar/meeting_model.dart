part of 'calendar.dart';

class BasicMeetingModel<T> {
  const BasicMeetingModel({
    required this.appointment,
    this.entity,
  });

  final Appointment appointment;
  final T? entity;

  String? get startTimeZone => appointment.startTimeZone;

  String? get endTimeZone => appointment.endTimeZone;

  String? get recurrenceRule => appointment.recurrenceRule;

  bool get isAllDay => appointment.isAllDay;

  String? get notes => appointment.notes;

  String? get location => appointment.location;

  List<Object>? get resourceIds => appointment.resourceIds;

  Object? get recurrenceId => appointment.recurrenceId;

  Object? get id => appointment.id;

  DateTime get startTime => appointment.startTime;

  DateTime get endTime => appointment.endTime;

  String get subject => appointment.subject;

  Color get color => appointment.color;

  List<DateTime>? get recurrenceExceptionDates => appointment.recurrenceExceptionDates;
}
