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
      Container(
        alignment: alignment,
        height: height ?? _defaultHeight,
        decoration: BoxDecoration(
          color: BasicAppColors.green,
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
                  height: 0
                ),
          ),
        ),
      );

  static Widget failure(
    String value, {
    double? height,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      Container(
        alignment: alignment,
        height: height ?? _defaultHeight,
        decoration: BoxDecoration(
          color: BasicAppColors.red,
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

  static Widget warning(
    String value, {
    double? height,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      Container(
        alignment: alignment,
        height: height ?? _defaultHeight,
        decoration: BoxDecoration(
          color: BasicAppColors.yellow,
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

  static Widget info(
    String value, {
    double? height,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) =>
      Container(
        alignment: alignment,
        height: height ?? _defaultHeight,
        decoration: BoxDecoration(
          color: BasicAppColors.blueLight,
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
