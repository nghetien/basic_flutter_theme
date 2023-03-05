import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:flutter/material.dart';

class BasicDivider extends StatelessWidget {
  const BasicDivider({
    this.height = 2,
    this.border,
    this.borderRadius,
    this.color,
    Key? key,
  }) : super(key: key);

  final double height;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color ?? BasicAppColors.greyOpacity01,
          borderRadius: borderRadius ?? BasicCorners.cornerBorder8,
          border: border,
        ),
      ),
    );
  }
}
