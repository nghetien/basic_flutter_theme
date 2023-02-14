import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:basic_flutter_theme/src/theme/spaces.dart';
import 'package:flutter/material.dart';

class BasicSelectBox extends StatelessWidget {
  const BasicSelectBox({
    Key? key,
    this.isCircle = true,
    this.value = false,
    this.onChanged,
    this.activeColor,
    this.checkColor,
    this.space,
    this.titleWidget,
    this.title,
    this.textStyle,
  })  : assert((title == null && titleWidget != null) || (title != null && titleWidget == null),
            'each of title and titleWidget must be null'),
        super(key: key);

  final bool isCircle;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final double? space;
  final Widget? titleWidget;
  final String? title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          checkColor: checkColor,
          shape: isCircle
              ? const CircleBorder()
              : const RoundedRectangleBorder(
                  borderRadius: BasicCorners.cornerBorder3,
                ),
          side: BorderSide(width: BasicBorders.med, color: BasicAppColors().primary),
        ),
        HSpace(space ?? BasicPaddings().p8),
        titleWidget ??
            Text(
              title ?? '',
              style: textStyle ??
                  BasicTextStyles.body.copyWith(
                    color: value ? activeColor ?? BasicAppColors().primary : null,
                  ),
            ),
      ],
    );
  }
}
