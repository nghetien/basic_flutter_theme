import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:basic_flutter_theme/src/theme/spaces.dart';
import 'package:basic_flutter_theme/src/utils/utils.dart';
import 'package:flutter/material.dart';

class BasicDynamicTag extends StatelessWidget {
  const BasicDynamicTag({
    Key? key,
    this.textContent,
    this.content,
    required this.whenClose,
    this.height,
    this.width,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.backgroundColorIcon,
    this.iconPadding,
  }) : super(key: key);

  final String? textContent;
  final Widget? content;
  final VoidCallback whenClose;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color? backgroundColorIcon;
  final EdgeInsets? iconPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: BasicPaddings().p8,
            vertical: BasicPaddings().p4,
          ),
      decoration: BoxDecoration(
        color: backgroundColor ?? BasicAppColors.greyOpacity01,
        borderRadius: borderRadius ?? BasicCorners.cornerBorder5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: content != null ? content! : Text(textContent ?? ''),
          ),
          HSpace.p8,
          Container(
            padding: iconPadding ?? EdgeInsets.all(2.scaleSize),
            decoration: BoxDecoration(
              color: backgroundColorIcon ?? BasicAppColors.greyOpacity04,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: whenClose,
              child: icon ??
                  Icon(
                    Icons.close,
                    size: iconSize ?? BasicIconSizes().s14,
                    color: iconColor,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
