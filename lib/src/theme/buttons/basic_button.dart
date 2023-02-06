import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:basic_flutter_theme/src/utils/utils.dart';
import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({
    Key? key,
    this.isFullColor = false,
    required this.onPressed,
    this.text,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.background,
    this.shadowColor = Colors.transparent,
    this.boxShadow,
    this.shape,
    this.textColor,
    this.fontSize,
    this.textStyle,
    this.textAlign = TextAlign.center,
    this.maxLines = 4,
    this.alignment,
  }) : super(key: key);

  final bool isFullColor;
  final VoidCallback onPressed;
  final String? text;
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Color? background;
  final Color shadowColor;
  final List<BoxShadow>? boxShadow;
  final OutlinedBorder? shape;
  final Color? textColor;
  final double? fontSize;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final int maxLines;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        height: height,
        width: width,
        decoration: BoxDecoration(boxShadow: boxShadow),
        child: ElevatedButton(
          key: key,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            alignment: alignment,
            backgroundColor: background ?? (isFullColor ? BasicAppColors().primary : null),
            shape: shape,
            padding: EdgeInsets.zero,
            shadowColor: shadowColor,
            elevation: 0,
            minimumSize: Size.zero,
          ),
          child: Padding(
            padding: padding ??
                EdgeInsets.symmetric(
                  horizontal: BasicPaddings().p18,
                  vertical: BasicPaddings().p12,
                ),
            child: child ??
                Text(
                  text ?? '',
                  textAlign: TextAlign.center,
                  maxLines: maxLines,
                  style: textStyle ??
                      BasicTextStyles.body.copyWith(
                        color: textColor ??
                            (isFullColor
                                ? BasicAppColors.white
                                : context.theme.textTheme.bodyMedium?.color),
                        height: 0,
                        fontSize: fontSize,
                      ),
                ),
          ),
        ),
      );
}
