import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:flutter/material.dart';

class BasicButtons {
  const BasicButtons._();

  static Widget button({
    Key? key,
    bool isFullColor = false,
    required VoidCallback onPressed,
    String? text,
    Widget? child,
    double? width,
    double? height,
    EdgeInsets? padding,
    Color? background,
    Color shadowColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
    OutlinedBorder? shape,
    Color? borderColor,
    double? borderWidth,
    Color? clickColor,
    double radius = BasicCorners.corner5,
    Color? textColor,
    TextStyle? textStyle,
    TextAlign textAlign = TextAlign.center,
    int maxLines = 4,
  }) =>
      Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        height: height,
        width: width,
        decoration: BoxDecoration(boxShadow: boxShadow),
        child: ElevatedButton(
          key: key,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: clickColor,
            backgroundColor:
                background ?? (isFullColor ? BasicAppColors().primary : BasicAppColors.white),
            shape: shape ??
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: borderColor ?? (isFullColor ? Colors.transparent : BasicAppColors.grey),
                    width: borderWidth ?? (isFullColor ? 0 : BasicBorders.thin),
                  ),
                  borderRadius: BorderRadius.circular(radius),
                ),
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
                            (isFullColor ? BasicAppColors.white : BasicAppColors.black),
                        height: 0,
                      ),
                ),
          ),
        ),
      );

  static Widget _textWidget({
    required bool iconIsInEdge,
    required Widget child,
  }) =>
      iconIsInEdge ? Expanded(child: child) : Flexible(child: child);

  static Widget buttonIcon({
    Key? key,
    bool isFullColor = false,
    required VoidCallback onPressed,
    String? text,
    required Icon icon,
    bool iconBeforeText = true,
    bool iconIsInEdge = false,
    double? width,
    double? height,
    EdgeInsets? padding,
    Color? background,
    Color shadowColor = Colors.transparent,
    List<BoxShadow>? boxShadow,
    OutlinedBorder? shape,
    Color? borderColor,
    double? borderWidth,
    Color? clickColor,
    double radius = BasicCorners.corner5,
    Color? textColor,
    TextStyle? textStyle,
    TextAlign textAlign = TextAlign.center,
    int maxLines = 4,
  }) {
    Widget? children;
    if (text == null) {
      children = icon;
    } else {
      children = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!iconBeforeText)
            Padding(padding: EdgeInsets.only(right: BasicPaddings().p8), child: icon),
          _textWidget(
            iconIsInEdge: iconIsInEdge,
            child: Text(
              text,
              textAlign: TextAlign.center,
              maxLines: maxLines,
              style: textStyle ??
                  BasicTextStyles.body.copyWith(
                    color: textColor ?? (isFullColor ? BasicAppColors.white : BasicAppColors.black),
                    height: 0,
                  ),
            ),
          ),
          if (iconBeforeText)
            Padding(padding: EdgeInsets.only(left: BasicPaddings().p8), child: icon),
        ],
      );
    }
    return button(
      key: key,
      isFullColor: isFullColor,
      onPressed: onPressed,
      child: children,
      width: width,
      height: height,
      padding: padding,
      background: background,
      shadowColor: shadowColor,
      boxShadow: boxShadow,
      shape: shape,
      borderColor: borderColor,
      borderWidth: borderWidth,
      clickColor: clickColor,
      radius: radius,
      textColor: textColor,
      textStyle: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
