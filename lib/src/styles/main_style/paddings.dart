class BasicPaddings {
  const BasicPaddings._();

  static double _paddingScale = 1;

  static void setScale(double value) => _paddingScale = value;

  static double get scale => _paddingScale;

  static double get xs => 4 * _paddingScale;

  static double get sm => 8 * _paddingScale;

  static double get med => 12 * _paddingScale;

  static double get lg => 18 * _paddingScale;

  static double get xl => 32 * _paddingScale;
}
