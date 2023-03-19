part of '../styles.dart';

class BasicIconSizes {
  BasicIconSizes._();

  static double _iconSizeScale = 1;

  static void setScale(double value) => _iconSizeScale = value;

  static double get scale => _iconSizeScale;

  static double get s14 => 14 * _iconSizeScale;

  static double get s18 => 18 * _iconSizeScale;

  static double get s20 => 20 * _iconSizeScale;

  static double get s24 => 24 * _iconSizeScale;

  static double get s32 => 32 * _iconSizeScale;

  static double get s40 => 40 * _iconSizeScale;
}
