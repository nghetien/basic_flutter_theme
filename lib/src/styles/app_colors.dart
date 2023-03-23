part of 'styles.dart';

class BasicAppColors {
  BasicAppColors._();

  /// The color of the app.
  static Color _primary = const Color(0xFF806DFF);
  static Color _primaryLight = const Color(0xFF9F54FC);
  static Color _primaryDark = const Color(0xFF6F58FF);

  static Color get primary => _primary;

  static Color get primaryLight => _primaryLight;

  static Color get primaryDark => _primaryDark;

  static void setBasicAppColors({
    required Color primary,
    required Color primaryLight,
    required Color primaryDark,
  }) {
    _primary = primary;
    _primaryLight = primaryLight;
    _primaryDark = primaryDark;
  }

  /// The background color of the app.
  static Color _bgPrimaryThemeDark = const Color(0xFF1F1D2C);
  static Color _bgSecondaryThemeDark = const Color(0xFF262837);
  static Color _bgPrimaryThemeLight = const Color(0xFFF0F2F5);
  static Color _bgSecondaryThemeLight = white;

  static Color get bgPrimaryThemeDark => _bgPrimaryThemeDark;

  static Color get bgSecondaryThemeDark => _bgSecondaryThemeDark;

  static Color get bgPrimaryThemeLight => _bgPrimaryThemeLight;

  static Color get bgSecondaryThemeLight => _bgSecondaryThemeLight;

  static void setBasicBgColors({
    Color? bgPrimaryThemeDark,
    Color? bgSecondaryThemeDark,
    Color? bgPrimaryThemeLight,
    Color? bgSecondaryThemeLight,
  }) {
    _bgPrimaryThemeDark = bgPrimaryThemeDark ?? _bgPrimaryThemeDark;
    _bgSecondaryThemeDark = bgSecondaryThemeDark ?? _bgSecondaryThemeDark;
    _bgPrimaryThemeLight = bgPrimaryThemeLight ?? _bgPrimaryThemeLight;
    _bgSecondaryThemeLight = bgSecondaryThemeLight ?? _bgSecondaryThemeLight;
  }

  /// The card color of the app.
  static Color get cardThemeDark => _bgSecondaryThemeDark;

  static Color get cardThemeLight => _bgSecondaryThemeLight;

  /// Color
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFFAAB3AC);
  static const red = Colors.redAccent;
  static const yellow = Color(0xFFFFA000);
  static const blueLight = Colors.lightBlue;
  static const green = Color(0xFF4AB178);

  static final Color greyOpacity01 = grey.withOpacity(0.1);
  static final Color greyOpacity04 = grey.withOpacity(0.4);
  static final Color greenOpacity01 = green.withOpacity(0.1);

  static final Color primaryOpacity01 = primary.withOpacity(0.1);
}
