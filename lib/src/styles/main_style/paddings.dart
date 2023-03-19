part of '../styles.dart';

class BasicPaddings {
  BasicPaddings._();

  static double _paddingScale = 1;

  static void setScale(double value) => _paddingScale = value;

  /// ----------------------------------------------------------------------------------------------

  static double _mainPadding = p14;

  static double get mainPadding => _mainPadding;

  static void setMainPadding(double value) => _mainPadding = value;

  /// ----------------------------------------------------------------------------------------------

  static double get scale => _paddingScale;

  static double get p4 => 4 * _paddingScale;

  static double get p8 => 8 * _paddingScale;

  static double get p12 => 12 * _paddingScale;

  static double get p14 => 14 * _paddingScale;

  static double get p18 => 18 * _paddingScale;

  static double get p32 => 32 * _paddingScale;
}
