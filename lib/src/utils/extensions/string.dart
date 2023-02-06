import 'package:flutter/material.dart';

extension BasicStringExtension on String {
  String get percentEncode {
    // Do initial percentage encoding of using Uri.encodeComponent()
    String input = Uri.encodeComponent(this);

    // Percentage encode characters ignored by Uri.encodeComponent()
    input = input.replaceAll('-', '%2D');
    input = input.replaceAll('_', '%5F');
    input = input.replaceAll('.', '%2E');
    input = input.replaceAll('!', '%21');
    input = input.replaceAll('~', '%7E');
    input = input.replaceAll('*', '%2A');
    input = input.replaceAll('\'', '%5C');
    input = input.replaceAll('(', '%28');
    input = input.replaceAll(')', '%29');

    return input;
  }

  DateTime get toDateTime => DateTime.parse(this);

  TimeOfDay get toTimeOfDay => TimeOfDay.fromDateTime(toDateTime);

  ValueKey get valueKey => ValueKey(this);
}
