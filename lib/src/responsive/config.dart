part of 'responsive.dart';

class BasicConfigResponsive {
  BasicConfigResponsive._();

  static List<double> _scales = [1, 1.05, 1.1];
  static double _scale = 1;
  static BasicScreenDevice _screenDevice = BasicScreenDevice.mobile;
  static double _currentWidth = 0;

  static List<double> get scales => _scales;

  static double get scale => _scale;

  static BasicScreenDevice get screenDevice => _screenDevice;

  static double get currentWidth => _currentWidth;

  static void setScales(List<double> value) => _scales = value;

  static void setScale(double value) => _scale = value;

  static void setScreenDevice(BasicScreenDevice value) => _screenDevice = value;

  static void setCurrentWidth(double value) => _currentWidth = value;

  static BasicScreenDevice getScreenDeviceFromWidth() {
    if (currentWidth >= BasicScreenWidth().widthDesktop) {
      return BasicScreenDevice.desktop;
    } else if (currentWidth >= BasicScreenWidth().widthTablet) {
      return BasicScreenDevice.tablet;
    } else {
      return BasicScreenDevice.mobile;
    }
  }

  static BasicScreenDevice getRealScreenDeviceLayout() {
    if (currentWidth >= BasicScreenWidth().widthDesktop) {
      if (BasicPlatform.isWeb) return BasicScreenDevice.desktop;
      return BasicScreenDevice.tablet;
    } else if (currentWidth >= BasicScreenWidth().widthTablet) {
      if (BasicPlatform.isWeb) return BasicScreenDevice.desktop;
      return BasicScreenDevice.tablet;
    } else {
      return BasicScreenDevice.mobile;
    }
  }

  static double getScaleFromScreenDevice() {
    switch (screenDevice) {
      case BasicScreenDevice.desktop:
        return _scales[2];
      case BasicScreenDevice.tablet:
        return _scales[1];
      default:
        return _scales[0];
    }
  }

  static void onResponsiveUpdate(double width) {
    setCurrentWidth(width);
    setScreenDevice(getScreenDeviceFromWidth());
    setScale(getScaleFromScreenDevice());
    BasicFontSizes.setScale(scale);
    BasicIconSizes.setScale(scale);
    BasicPaddings.setScale(scale);
  }
}
