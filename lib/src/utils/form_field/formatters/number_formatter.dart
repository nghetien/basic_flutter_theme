import 'package:flutter/services.dart';

class NumberFormatter {
  NumberFormatter._privateConstructor();

  static final NumberFormatter _instance = NumberFormatter._privateConstructor();

  factory NumberFormatter() => _instance;

  static final TextInputFormatter digitsOnly = FilteringTextInputFormatter.digitsOnly;
}
