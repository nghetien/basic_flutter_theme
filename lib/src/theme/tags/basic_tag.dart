part of 'tags.dart';

class BasicTags {
  const BasicTags._();

  static Widget success(
    String value, {
    double? height,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      _tag(
        value,
        height: height,
        padding: padding,
        borderRadius: borderRadius,
        textStyle: textStyle,
        color: BasicAppColors.green,
      );

  static Widget failure(
    String value, {
    double? height,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      _tag(
        value,
        height: height,
        padding: padding,
        borderRadius: borderRadius,
        textStyle: textStyle,
        color: BasicAppColors.red,
      );

  static Widget warning(
    String value, {
    double? height,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      _tag(
        value,
        height: height,
        padding: padding,
        borderRadius: borderRadius,
        textStyle: textStyle,
        color: BasicAppColors.yellow,
      );

  static Widget info(
    String value, {
    double? height,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      _tag(
        value,
        height: height,
        padding: padding,
        borderRadius: borderRadius,
        textStyle: textStyle,
        color: BasicAppColors.blueLight,
      );

  static Widget draft(
    String value, {
    double? height,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      _tag(
        value,
        height: height,
        padding: padding,
        borderRadius: borderRadius,
        textStyle: textStyle,
        color: BasicAppColors.grey,
      );

  static Widget _tag(
    String value, {
    double? height,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
    Color? color,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BasicCorners.mainCornerBorder,
        ),
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: BasicPaddings.p8,
              vertical: BasicPaddings.p4,
            ),
        child: Text(
          value,
          style: textStyle ??
              BasicTextStyles.body.copyWith(
                color: BasicAppColors.white,
                height: 0,
              ),
          textAlign: TextAlign.center,
        ),
      );
}
