import 'package:flutter/material.dart';

class BasicAppColors {
  BasicAppColors._privateConstructor();

  static final BasicAppColors _instance = BasicAppColors._privateConstructor();

  factory BasicAppColors() => _instance;

  /// The color of the app.
  Color _primary = const Color(0xFF806DFF);
  Color _primaryLight = const Color(0xFF9F54FC);
  Color _primaryDark = const Color(0xFF6F58FF);

  Color get primary => _primary;

  Color get primaryLight => _primaryLight;

  Color get primaryDark => _primaryDark;

  void setBasicAppColors({
    required Color primary,
    required Color primaryLight,
    required Color primaryDark,
  }) {
    _primary = primary;
    _primaryLight = primaryLight;
    _primaryDark = primaryDark;
  }

  /// The background color of the app.
  Color _bgPrimaryThemeDark = const Color(0xFF1F1D2C);
  Color _bgSecondaryThemeDark = const Color(0xFF262837);
  Color _bgPrimaryThemeLight = const Color(0xFFF0F2F5);
  Color _bgSecondaryThemeLight = white;

  Color get bgPrimaryThemeDark => _bgPrimaryThemeDark;

  Color get bgSecondaryThemeDark => _bgSecondaryThemeDark;

  Color get bgPrimaryThemeLight => _bgPrimaryThemeLight;

  Color get bgSecondaryThemeLight => _bgSecondaryThemeLight;

  void setBasicBgColors({
    required Color bgPrimaryThemeDark,
    required Color bgSecondaryThemeDark,
    required Color bgPrimaryThemeLight,
    required Color bgSecondaryThemeLight,
  }) {
    _bgPrimaryThemeDark = bgPrimaryThemeDark;
    _bgSecondaryThemeDark = bgSecondaryThemeDark;
    _bgPrimaryThemeLight = bgPrimaryThemeLight;
    _bgSecondaryThemeLight = bgSecondaryThemeLight;
  }

  /// The card color of the app.
  Color get cardThemeDark => _bgSecondaryThemeDark;

  Color get cardThemeLight => _bgSecondaryThemeLight;

  /// Color
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFFAAB3AC);
  static const red = Colors.redAccent;
  static const yellow = Color(0xFFFFA000);
  static const blueLight = Colors.lightBlue;
  static const green = Color(0xFF4AB178);

  static final Color greyOpacity01 = grey.withOpacity(0.1);
}
