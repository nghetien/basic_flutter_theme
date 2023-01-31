import 'package:google_fonts/google_fonts.dart';

class BasicFonts {
  BasicFonts._privateConstructor();

  static final BasicFonts _instance = BasicFonts._privateConstructor();

  factory BasicFonts() => _instance;

  static final String defaultFont = GoogleFonts.poppins().fontFamily!;

  String _body = defaultFont;
  String _label = defaultFont;
  String _title = defaultFont;
  String _headline = defaultFont;
  String _display = defaultFont;

  String get body => _body;

  String get label => _label;

  String get title => _title;

  String get headline => _headline;

  String get display => _display;

  void setBody(String value) => _body = value;

  void setLabel(String value) => _label = value;

  void setTitle(String value) => _title = value;

  void setHeadline(String value) => _headline = value;

  void setDisplay(String value) => _display = value;

  void setBasicFonts({
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