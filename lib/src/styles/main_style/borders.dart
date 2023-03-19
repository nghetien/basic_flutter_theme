part of '../styles.dart';

class BasicBorders {
  const BasicBorders._();

  static double _mainBorders = thin;

  static double get mainBorders => _mainBorders;

  static void setMainBorders(double value) => _mainBorders = value;

  /// ----------------------------------------------------------------------------------------------

  static const double thin = 1;

  static const double med = 2;

  static const double thick = 4;
}
