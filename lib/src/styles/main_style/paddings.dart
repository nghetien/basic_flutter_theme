class BasicPaddings {
  BasicPaddings._privateConstructor();

  static final BasicPaddings _instance = BasicPaddings._privateConstructor();

  factory BasicPaddings() => _instance;

  double _paddingScale = 1;

  void setScale(double value) => _paddingScale = value;

  double get scale => _paddingScale;

  double get p4 => 4 * _paddingScale;

  double get p8 => 8 * _paddingScale;

  double get p12 => 12 * _paddingScale;

  double get p18 => 18 * _paddingScale;

  double get p32 => 32 * _paddingScale;
}
