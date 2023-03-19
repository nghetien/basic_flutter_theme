import 'package:flutter/services.dart';

class BasicNumberFormatter {
  BasicNumberFormatter._privateConstructor();

  static final BasicNumberFormatter _instance = BasicNumberFormatter._privateConstructor();

  factory BasicNumberFormatter() => _instance;

  static final TextInputFormatter digitsOnly = FilteringTextInputFormatter.digitsOnly;
}
