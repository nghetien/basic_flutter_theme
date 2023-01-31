class BasicFontSizes {
  BasicFontSizes._privateConstructor();

  static final BasicFontSizes _instance = BasicFontSizes._privateConstructor();

  factory BasicFontSizes() => _instance;

  double _fontSizeScale = 1;

  void setScale(double value) => _fontSizeScale = value;

  double get scale => _fontSizeScale;

  double get s10 => 10 * _fontSizeScale;

  double get s11 => 11 * _fontSizeScale;

  double get s12 => 12 * _fontSizeScale;

  double get s13 => 13 * _fontSizeScale;

  double get s14 => 14 * _fontSizeScale;

  double get s15 => 15 * _fontSizeScale;

  double get s16 => 16 * _fontSizeScale;

  double get s17 => 17 * _fontSizeScale;

  double get s18 => 18 * _fontSizeScale;

  double get s19 => 19 * _fontSizeScale;

  double get s20 => 20 * _fontSizeScale;

  double get s22 => 22 * _fontSizeScale;

  double get s24 => 24 * _fontSizeScale;

  double get s36 => 36 * _fontSizeScale;

  double get s48 => 48 * _fontSizeScale;
}