part of 'tags.dart';

class BasicTags {
  const BasicTags._();

  static final _defaultHeight = 29.scaleSize;

  static Widget success(
    String value, {
    double? height,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      tag(
        value,
        height: height,
        alignment: alignment,
        padding: padding,
        borderRadius: borderRadius,
        textStyle: textStyle,
        color: BasicAppColors.green,
      );

  static Widget failure(
    String value, {
    double? height,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      tag(
        value,
        height: height,
        alignment: alignment,
        padding: padding,
        borderRadius: borderRadius,
        textStyle: textStyle,
        color: BasicAppColors.red,
      );

  static Widget warning(
    String value, {
    double? height,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      tag(
        value,
        height: height,
        alignment: alignment,
        padding: padding,
        borderRadius: borderRadius,
        textStyle: textStyle,
        color: BasicAppColors.yellow,
      );

  static Widget info(
    String value, {
    double? height,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      tag(
        value,
        height: height,
        alignment: alignment,
        padding: padding,
        borderRadius: borderRadius,
        textStyle: textStyle,
        color: BasicAppColors.blueLight,
      );

  static Widget draft(
    String value, {
    double? height,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      tag(
        value,
        height: height,
        alignment: alignment,
        padding: padding,
        borderRadius: borderRadius,
        textStyle: textStyle,
        color: BasicAppColors.grey,
      );

  static Widget tag(
    String value, {
    double? height,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
    Color? color,
  }) =>
      Container(
        alignment: alignment,
        height: height ?? _defaultHeight,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BasicCorners.mainCornerBorder,
        ),
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: BasicPaddings.p8,
              vertical: BasicPaddings.p4,
            ),
        child: Center(
          child: Text(
            value,
            style: textStyle ??
                BasicTextStyles.body.copyWith(
                  color: BasicAppColors.white,
                  height: 0,
                ),
          ),
        ),
      );
}
