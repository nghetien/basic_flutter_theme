import 'package:basic_flutter_theme/src/responsive/responsive.dart';

extension BasicScreenDeviceExtension on BasicScreenDevice {
  bool get isMobile => BasicScreenDevice.mobile == this;

  bool get isTablet => BasicScreenDevice.tablet == this;

  bool get isDesktop => BasicScreenDevice.desktop == this;
}
