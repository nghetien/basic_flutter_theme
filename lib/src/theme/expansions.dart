import 'package:flutter/material.dart';

import '../styles/main_style/main_style.dart';
import 'cards.dart';

class BasicExpansions {
  const BasicExpansions._();

  static Widget expansion({
    Key? key,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    Widget? child,
    bool semanticContainer = true,
    Widget? customTitle,
    String? title,
    Widget? leading,
    Widget? trailing,
    CrossAxisAlignment? expandedCrossAxisAlignment,
    EdgeInsetsGeometry? childrenPadding,
    Color? collapsedTextColor,
    Color? collapsedIconColor,
    Color? iconColor,
    required List<Widget> children,
  }) =>
      BasicCards.card(
        color: color,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        elevation: elevation,
        shape: shape,
        borderOnForeground: borderOnForeground,
        margin: margin,
        clipBehavior: clipBehavior,
        child: ExpansionTile(
          key: key,
          title: customTitle ??
              Text(
                title ?? '',
                style: BasicTextStyles.titleMedium,
              ),
          leading: leading,
          trailing: trailing,
          expandedCrossAxisAlignment: expandedCrossAxisAlignment,
          childrenPadding: childrenPadding ?? EdgeInsets.all(BasicPaddings().p12),
          collapsedTextColor: collapsedTextColor,
          collapsedIconColor: collapsedIconColor,
          iconColor: iconColor,
          children: children,
        ),
        semanticContainer: semanticContainer,
      );
}
