import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:flutter/material.dart';

class BasicBadge extends StatelessWidget {
  const BasicBadge({
    Key? key,
    required this.child,
    this.count = 0,
    this.color = BasicAppColors.red,
    this.top,
    this.right,
  }) : super(key: key);

  final Widget child;
  final int count;
  final Color color;
  final double? top;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        child,
        if (count > 0)
          Positioned(
            top: top ?? -10,
            right: right ?? -10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 2,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BasicCorners.cornerBorder20,
              ),
              child: Text(
                count > 999 ? '999+' : count.toString(),
                style: BasicTextStyles.label.copyWith(
                  color: BasicAppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
