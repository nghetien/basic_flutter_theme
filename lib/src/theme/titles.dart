import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:basic_flutter_theme/src/utils/utils.dart';
import 'package:flutter/material.dart';

enum BasicTitleType {
  level1,
  level2,
  level3,
  level4,
  level5,
  level6,
  ;

  TextStyle get textStyle {
    switch (this) {
      case BasicTitleType.level1:
        return BasicTextStyles.display.copyWith(
          fontWeight: FontWeight.w500,
        );
      case BasicTitleType.level2:
        return BasicTextStyles.headline.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 30.scaleSize,
        );
      case BasicTitleType.level3:
        return BasicTextStyles.headline.copyWith(
          fontWeight: FontWeight.w500,
        );
      case BasicTitleType.level4:
        return BasicTextStyles.titleLarge.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: BasicFontSizes().s20,
        );
      case BasicTitleType.level5:
        return BasicTextStyles.titleMedium.copyWith(
          fontWeight: FontWeight.w500,
        );
      case BasicTitleType.level6:
        return BasicTextStyles.body.copyWith(
          fontWeight: FontWeight.w500,
        );
    }
  }
}

class BasicTitle extends StatelessWidget {
  const BasicTitle(
    this.text, {
    Key? key,
    required this.titleType,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.height,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : super(key: key);

  final String text;
  final BasicTitleType titleType;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final double? height;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;

  @override
  Widget build(BuildContext context) => Text(
    text,
        style: titleType.textStyle.copyWith(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          height: height,
        ),
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
}
