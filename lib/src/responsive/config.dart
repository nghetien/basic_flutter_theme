import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:basic_flutter_theme/src/utils/utils.dart';


import 'screen_device.dart';
import 'screen_width.dart';

class BasicConfigResponsive {
  BasicConfigResponsive._privateConstructor();

  static final BasicConfigResponsive _instance = BasicConfigResponsive._privateConstructor();

  factory BasicConfigResponsive() => _instance;

  List<double> _scales = [1, 1.05, 1.1];
  double _scale = 1;
  BasicScreenDevice _screenDevice = BasicScreenDevice.mobile;

  List<double> get scales => _scales;

  double get scale => _scale;

  BasicScreenDevice get screenDevice => _screenDevice;

  void setScales(List<double> value) => _scales = value;

  void setScale(double value) => _scale = value;

  void setScreenDevice(BasicScreenDevice value) => _screenDevice = value;

  BasicScreenDevice getScreenDeviceFromWidth(double width) {
    if (width >= BasicScreenWidth().widthDesktop) {
      if(BasicPlatform.isWeb) return BasicScreenDevice.desktop;
      return BasicScreenDevice.tablet;
    } else if (width >= BasicScreenWidth().widthTablet) {
      return BasicScreenDevice.tablet;
    } else {
      return BasicScreenDevice.mobile;
    }
  }

  double getScaleFromScreenDevice() {
    switch (screenDevice) {
      case BasicScreenDevice.desktop:
        return _scales[2];
      case BasicScreenDevice.tablet:
        return _scales[1];
      default:
        return _scales[0];
    }
  }

  void onResponsiveUpdate(double width) {
    setScreenDevice(getScreenDeviceFromWidth(width));
    setScale(getScaleFromScreenDevice());
    BasicFontSizes().setScale(scale);
    BasicIconSizes().setScale(scale);
    BasicPaddings().setScale(scale);
  }
}
