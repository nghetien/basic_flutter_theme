import 'package:flutter/material.dart';

import 'font_sizes.dart';
import 'fonts.dart';

class BasicTextStyles {
  const BasicTextStyles._();

  static const TextStyle _regular = TextStyle(
    fontFamily: BasicFonts.regular,
    height: 1.5,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );
  static const TextStyle _medium = TextStyle(
    fontFamily: BasicFonts.medium,
    height: 1.5,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );
  static const TextStyle _semiBold = TextStyle(
    fontFamily: BasicFonts.semiBold,
    height: 1.5,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );
  static const TextStyle _bold = TextStyle(
    fontFamily: BasicFonts.bold,
    height: 1.5,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );
  static const TextStyle _default = TextStyle(
    overflow: TextOverflow.ellipsis,
  );

  /// Title
  static TextStyle get titleBold => _bold.copyWith(
        fontSize: BasicFontSizes.s24,
      );

  /// Text
  static TextStyle get textSemiBold => _semiBold.copyWith(
        fontSize: BasicFontSizes.s16,
      );

  static TextStyle get textBold => _bold.copyWith(
        fontSize: BasicFontSizes.s18,
      );

  static TextStyle get textRegular => _regular.copyWith(
        fontSize: BasicFontSizes.s18,
      );

  static TextStyle get textDefault => _default.copyWith(
        fontSize: BasicFontSizes.s18,
        height: 1.5,
        letterSpacing: 0.5,
      );

  static TextStyle get textMediumDefault => _default.copyWith(
        fontSize: BasicFontSizes.s16,
      );

  static TextStyle get textSmallDefault => textDefault.copyWith(
        fontSize: BasicFontSizes.s14,
      );

  /// Input
  static TextStyle get inputDefault => _default.copyWith(
        fontSize: BasicFontSizes.s16,
        fontWeight: FontWeight.normal,
      );

  /// Button
  static TextStyle get buttonSemiBold => textSemiBold;

  static TextStyle get buttonBold => textBold;

  static TextStyle get buttonMedium => _medium.copyWith(
        fontSize: BasicFontSizes.s18,
      );
}
