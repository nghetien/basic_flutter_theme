import 'package:flutter/material.dart';

class BasicSizeOfDevice {
  const BasicSizeOfDevice._();

  static final double deviceWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

  static final double deviceHeight =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
}
