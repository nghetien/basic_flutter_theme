import 'package:basic_flutter_theme/src/src.dart';
import 'package:flutter/material.dart';

class BasicCard extends StatelessWidget {
  const BasicCard({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.border,
  }) : super(key: key);

  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding ?? EdgeInsets.all(BasicPaddings().p18),
        decoration: BoxDecoration(
          color: backgroundColor ?? context.theme.colorScheme.background,
          borderRadius: borderRadius ?? BasicCorners.cornerBorder5,
          border: border ??
              Border.all(
                color: Colors.transparent,
                width: 0,
              ),
        ),
        child: child,
      );
}
