import 'package:flutter/material.dart';

import 'config.dart';
import 'screen_device.dart';

class BasicResponsive {
  BasicResponsive._();

  static Widget appResponsiveBuilder(Widget child) => LayoutBuilder(
        builder: (_, constraints) {
          BasicConfigResponsive().onResponsiveUpdate(constraints.maxWidth);
          return child;
        },
      );

  static Widget responsiveBuilder({
    required Widget children,
    Widget? mobile,
    Widget? tablet,
    Widget? desktop,
  }) =>
      LayoutBuilder(
        builder: (_, __) {
          switch (BasicConfigResponsive().screenDevice) {
            case BasicScreenDevice.desktop:
              return desktop ?? children;
            case BasicScreenDevice.tablet:
              return tablet ?? children;
            default:
              return mobile ?? children;
          }
        },
      );
}
