part of 'responsive.dart';

class BasicResponsive {
  BasicResponsive._();

  static Widget appResponsiveBuilder(
    Widget child, {
    Key? key,
  }) =>
      LayoutBuilder(
        key: key,
        builder: (_, constraints) {
          BasicConfigResponsive.onResponsiveUpdate(constraints.maxWidth);
          return child;
        },
      );

  static Widget responsiveBuilder({
    Key? key,
    Widget? children,
    Widget? mobile,
    Widget? tablet,
    Widget? desktop,
  }) =>
      LayoutBuilder(
        key: key,
        builder: (_, __) {
          switch (BasicConfigResponsive.screenDevice) {
            case BasicScreenDevice.desktop:
              return desktop ?? children!;
            case BasicScreenDevice.tablet:
              return tablet ?? children!;
            default:
              return mobile ?? children!;
          }
        },
      );

  static Widget responsiveBuilderWithOutLayoutBuilder({
    Widget? children,
    Widget? mobile,
    Widget? tablet,
    Widget? desktop,
  }) {
    switch (BasicConfigResponsive.screenDevice) {
      case BasicScreenDevice.desktop:
        return desktop ?? children!;
      case BasicScreenDevice.tablet:
        return tablet ?? children!;
      default:
        return mobile ?? children!;
    }
  }
}
