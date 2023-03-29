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

class BasicCheckBox extends StatelessWidget {
  const BasicCheckBox({
    Key? key,
    this.type = BasicCheckBoxType.check,
    this.value = false,
    this.onChanged,
    this.activeColor,
    this.checkColor,
  }) : super(key: key);

  final BasicCheckBoxType type;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? checkColor;

  @override
  Widget build(BuildContext context) => Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor ?? type.style.activeColor,
        checkColor: checkColor ?? type.style.checkColor,
        shape: type.style.shape,
        side: BorderSide(width: BasicBorders.med, color: BasicAppColors.primary),
      );
}
