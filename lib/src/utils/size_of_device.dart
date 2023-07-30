import 'package:flutter/material.dart';

class BasicSizeOfDevice {
  const BasicSizeOfDevice._();

  static final double deviceWidth =
      MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;

  static final double deviceHeight =
      MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;
}
