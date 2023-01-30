class BasicScreenWidth {
  BasicScreenWidth._privateConstructor();

  static final BasicScreenWidth _instance = BasicScreenWidth._privateConstructor();

  factory BasicScreenWidth() => _instance;

  double _desktop = 1200;
  double _tablet = 650;
  double _mobile = 300;

  double get widthDesktop => _desktop;

  double get widthTablet => _tablet;

  double get widthMobile => _mobile;

  void setBasicScreenWidth({
    required double desktop,
    required double tablet,
    required double mobile,
  }) {
    _desktop = desktop;
    _tablet = tablet;
    _mobile = mobile;
  }
}
