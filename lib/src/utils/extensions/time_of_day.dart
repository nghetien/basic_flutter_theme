import 'package:flutter/material.dart';

extension BasicTimeOfDayExtension on TimeOfDay? {
  String get convertToString => this == null
      ? ""
      : "${this!.hour.toString().padLeft(2, '0')}:${this!.minute.toString().padLeft(2, '0')}";
}
