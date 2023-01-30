class BasicIconSizes {
  const BasicIconSizes._();

  static double _iconSizeScale = 1;

  static void setScale(double value) => _iconSizeScale = value;

  static double get scale => _iconSizeScale;

  static double get xs => 14 * _iconSizeScale;

  static double get sm => 18 * _iconSizeScale;

  static double get med => 24 * _iconSizeScale;

  static double get lg => 32 * _iconSizeScale;

  static double get xl => 40 * _iconSizeScale;
}
