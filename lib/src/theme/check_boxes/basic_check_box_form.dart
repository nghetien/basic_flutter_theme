part of 'check_boxes.dart';

class BasicCheckBoxStyle {
  final Color activeColor;
  final Color checkColor;
  final OutlinedBorder shape;

  const BasicCheckBoxStyle({
    required this.checkColor,
    required this.activeColor,
    required this.shape,
  });
}

enum BasicCheckBoxType {
  radio,
  check;

  bool get isRadio => this == BasicCheckBoxType.radio;

  bool get isCheck => this == BasicCheckBoxType.check;

  BasicCheckBoxStyle get style {
    switch (this) {
      case BasicCheckBoxType.radio:
        return BasicCheckBoxStyle(
          activeColor: BasicAppColors.primary,
          checkColor: BasicAppColors.primary,
          shape: const CircleBorder(),
        );
      case BasicCheckBoxType.check:
        return BasicCheckBoxStyle(
          activeColor: BasicAppColors.primary,
          checkColor: BasicAppColors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BasicCorners.cornerBorder3,
          ),
        );
    }
  }
}

class BasicCheckBoxForm extends StatelessWidget {
  const BasicCheckBoxForm({
    Key? key,
    this.name = '',
    this.title,
    this.titleText,
    this.titleTextStyle,
    this.titleTextFontWeight,
    this.contentPadding = EdgeInsets.zero,
    this.titleTextColor,
    this.type = BasicCheckBoxType.check,
    this.initValue = false,
    this.selected = false,
    this.onChanged,
    this.activeColor,
    this.checkColor,
    this.valueTransformer,
    this.enabled = true,
  }) : super(key: key);

  final String name;
  final Widget? title;
  final String? titleText;
  final TextStyle? titleTextStyle;
  final FontWeight? titleTextFontWeight;
  final Color? titleTextColor;
  final EdgeInsets contentPadding;
  final BasicCheckBoxType type;
  final bool initValue;
  final bool selected;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final ValueTransformer? valueTransformer;
  final bool enabled;

  @override
  Widget build(BuildContext context) => FormBuilderCheckbox(
        name: name,
        title: title ??
            Text(
              titleText ?? '',
              style: titleTextStyle ??
                  BasicTextStyles.body.copyWith(
                    color: titleTextColor,
                    fontWeight: titleTextFontWeight,
                  ),
            ),
        contentPadding: contentPadding,
        initialValue: initValue,
        selected: selected,
        onChanged: onChanged,
        activeColor: activeColor ?? type.style.activeColor,
        checkColor: checkColor ?? type.style.checkColor,
        shape: type.style.shape,
        side: BorderSide(width: BasicBorders.med, color: BasicAppColors.primary),
        onReset: () => onChanged!(false),
        decoration: basicInputDecoration(
          context,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          fillColor: Colors.transparent,
        ),
        valueTransformer: valueTransformer,
        enabled: enabled,
      );
}
