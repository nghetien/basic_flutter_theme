class BasicIconSizes {
  BasicIconSizes._privateConstructor();

  static final BasicIconSizes _instance = BasicIconSizes._privateConstructor();

  factory BasicIconSizes() => _instance;

  double _iconSizeScale = 1;

  void setScale(double value) => _iconSizeScale = value;

  double get scale => _iconSizeScale;

  double get xs => 14 * _iconSizeScale;

  double get sm => 18 * _iconSizeScale;

  double get med => 24 * _iconSizeScale;

  double get lg => 32 * _iconSizeScale;

  double get xl => 40 * _iconSizeScale;
}
