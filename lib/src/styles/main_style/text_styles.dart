import 'package:flutter/material.dart';

import 'font_sizes.dart';
import 'fonts.dart';

class BasicTextStyles {
  const BasicTextStyles._();

  static final TextStyle body = TextStyle(
    fontFamily: BasicFonts().body,
    letterSpacing: 0.15,
    fontSize: BasicFontSizes().s14,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle label = TextStyle(
    fontFamily: BasicFonts().label,
    letterSpacing: 0.1,
    fontSize: BasicFontSizes().s12,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle titleMedium = TextStyle(
    fontFamily: BasicFonts().title,
    letterSpacing: 0.15,
    fontSize: BasicFontSizes().s16,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle titleLarge = TextStyle(
    fontFamily: BasicFonts().title,
    letterSpacing: 0,
    fontSize: BasicFontSizes().s22,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle headline = TextStyle(
    fontFamily: BasicFonts().headline,
    letterSpacing: 0,
    fontSize: BasicFontSizes().s24,
    overflow: TextOverflow.ellipsis,
  );

static final TextStyle display = TextStyle(
    fontFamily: BasicFonts().display,
    letterSpacing: 0,
    fontSize: BasicFontSizes().s36,
    overflow: TextOverflow.ellipsis,
  );
}
