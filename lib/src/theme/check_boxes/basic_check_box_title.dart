part of 'check_boxes.dart';

class BasicCheckBoxTitle extends StatelessWidget {
  const BasicCheckBoxTitle({
    Key? key,
    this.type = BasicCheckBoxType.check,
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

  final BasicCheckBoxType type;
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
        BasicCheckBox(
          type: type,
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          checkColor: checkColor,
        ),
        HSpace(space ?? BasicPaddings.p8),
        titleWidget ??
            Text(
              title ?? '',
              style: textStyle ??
                  BasicTextStyles.body.copyWith(
                    color: value ? activeColor ?? BasicAppColors.primary : null,
                  ),
            ),
      ],
    );
  }
}
