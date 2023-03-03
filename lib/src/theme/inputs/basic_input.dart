part of 'inputs.dart';

class BasicInputType {
  const BasicInputType(
      double height, EdgeInsets padding, TextStyle textStyle, TextStyle hintStyle, int? maxLines)
      : _height = height,
        _padding = padding,
        _textStyle = textStyle,
        _hintStyle = hintStyle,
        _maxLines = maxLines;

  final double _height;
  final EdgeInsets _padding;
  final TextStyle _textStyle;
  final TextStyle _hintStyle;
  final int? _maxLines;

  double get height => _height;

  EdgeInsets get padding => _padding;

  TextStyle get textStyle => _textStyle;

  TextStyle get hintStyle => _hintStyle;

  int? get maxLines => _maxLines;

  static final BasicInputType large = BasicInputType(
    42,
    const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 14.5,
    ),
    BasicTextStyles.body,
    BasicTextStyles.body,
    1,
  );

  static final BasicInputType medium = BasicInputType(
    35,
    const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 12.5,
    ),
    BasicTextStyles.label,
    BasicTextStyles.label,
    1,
  );

  static final BasicInputType areaSmall = BasicInputType(
    60,
    const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 13,
    ),
    BasicTextStyles.body,
    BasicTextStyles.body,
    2,
  );

  static final BasicInputType areaMedium = BasicInputType(
    80,
    const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 12.5,
    ),
    BasicTextStyles.body,
    BasicTextStyles.body,
    3,
  );

  static final BasicInputType areaLarge = BasicInputType(
    100,
    const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 12,
    ),
    BasicTextStyles.body,
    BasicTextStyles.body,
    4,
  );
}

class BasicInput extends StatelessWidget {
  const BasicInput({
    Key? key,
    this.inputType,
    this.width,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textInputAction,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.enabled,
    this.obscureText = false,
    this.cursorColor,
    this.autoValidateMode,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.isDense,
    this.filled,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.fillColor,
    this.hoverColor,
    this.labelText,
    this.labelStyle,
    this.floatingLabelStyle,
    this.floatingLabelBehavior,
    this.hintText,
    this.hintStyle,
    this.errorText,
    this.errorMaxLines,
    this.errorStyle,
  }) : super(key: key);

  final BasicInputType? inputType;
  final double? width;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final TextAlignVertical? textAlignVertical;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool? enabled;
  final bool obscureText;
  final Color? cursorColor;
  final AutovalidateMode? autoValidateMode;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter? onSaved;
  final bool? isDense;
  final bool? filled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color? fillColor;
  final Color? hoverColor;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final int? errorMaxLines;
  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          initialValue: initialValue,
          style: textStyle ?? inputType?.textStyle,
          textAlign: textAlign,
          textInputAction: textInputAction,
          textAlignVertical: textAlignVertical,
          keyboardType: keyboardType,
          maxLines: maxLines ?? inputType?.maxLines,
          minLines: minLines,
          maxLength: maxLength,
          enabled: enabled,
          obscureText: obscureText,
          cursorColor: cursorColor,
          autovalidateMode: autoValidateMode,
          validator: validator,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          decoration: basicInputDecoration(
            context,
            enabled: enabled,
            isDense: isDense,
            filled: filled,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding ?? inputType?.padding ?? BasicInputType.large.padding,
            focusedBorder: focusedBorder,
            enabledBorder: enabledBorder,
            disabledBorder: disabledBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: focusedErrorBorder,
            fillColor: fillColor,
            hoverColor: hoverColor,
            labelText: labelText,
            labelStyle: labelStyle,
            floatingLabelStyle: floatingLabelStyle,
            floatingLabelBehavior: floatingLabelBehavior,
            hintText: hintText,
            hintStyle: hintStyle ?? inputType?.hintStyle,
            errorText: errorText,
            errorMaxLines: errorMaxLines,
            errorStyle: errorStyle,
          ),
        ),
      );
}
