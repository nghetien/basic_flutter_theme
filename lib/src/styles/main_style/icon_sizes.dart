class BasicIconSizes {
  BasicIconSizes._privateConstructor();

  static final BasicIconSizes _instance = BasicIconSizes._privateConstructor();

  factory BasicIconSizes() => _instance;

  double _iconSizeScale = 1;

  void setScale(double value) => _iconSizeScale = value;

  double get scale => _iconSizeScale;

  double get s14 => 14 * _iconSizeScale;

  double get s18 => 18 * _iconSizeScale;

  double get s20 => 20 * _iconSizeScale;

  double get s24 => 24 * _iconSizeScale;

  double get s32 => 32 * _iconSizeScale;

  double get s40 => 40 * _iconSizeScale;
}
