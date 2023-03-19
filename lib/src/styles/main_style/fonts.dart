part of '../styles.dart';

class BasicFonts {
  BasicFonts._();

  static const String roboto = 'Roboto';

  static String _defaultFont = roboto;
  static String _body = roboto;
  static String _label = roboto;
  static String _title = roboto;
  static String _headline = roboto;
  static String _display = roboto;

  static String get defaultFont => _defaultFont;

  static String get body => _body;

  static String get label => _label;

  static String get title => _title;

  static String get headline => _headline;

  static String get display => _display;

  static void setDefaultFont(String value) => _defaultFont = value;

  static void setBody(String value) => _body = value;

  static void setLabel(String value) => _label = value;

  static void setTitle(String value) => _title = value;

  static void setHeadline(String value) => _headline = value;

  static void setDisplay(String value) => _display = value;

  static void setBasicFonts({
    required String body,
    required String label,
    required String title,
    required String headline,
    required String display,
  }) {
    _body = body;
    _label = label;
    _title = title;
    _headline = headline;
    _display = display;
  }
}