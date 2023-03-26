import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:flutter/material.dart';

class BasicExpansion extends StatelessWidget {
  const BasicExpansion({
    Key? key,
    this.title,
    this.customTitle,
    this.leading,
    this.trailing,
    this.children = const [],
    this.color,
    this.collapsedTextColor,
    this.collapsedIconColor,
    this.iconColor,
    this.childrenPadding,
    this.border,
    this.borderRadius,
    this.expandedCrossAxisAlignment,
  }) : super(key: key);

  final String? title;
  final Widget? customTitle;
  final Widget? leading;
  final Widget? trailing;
  final List<Widget> children;
  final Color? color;
  final Color? collapsedTextColor;
  final Color? collapsedIconColor;
  final Color? iconColor;
  final EdgeInsetsGeometry? childrenPadding;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final CrossAxisAlignment? expandedCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BasicCorners.mainCornerBorder,
        border: border ??
            Border.all(
              color: BasicAppColors.greyOpacity04,
              width: BasicBorders.thin,
            ),
      ),
      child: ExpansionTile(
        key: key,
        title: customTitle ??
            Text(
              title ?? '',
              style: BasicTextStyles.body,
            ),
        leading: leading,
        trailing: trailing,
        expandedCrossAxisAlignment: expandedCrossAxisAlignment,
        childrenPadding: childrenPadding ?? EdgeInsets.all(BasicPaddings.mainPadding),
        collapsedTextColor: collapsedTextColor,
        collapsedIconColor: collapsedIconColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BasicCorners.mainCornerBorder,
        ),
        iconColor: iconColor,
        children: children,
      ),
    );
  }
}
