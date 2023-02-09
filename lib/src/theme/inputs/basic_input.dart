import 'package:basic_flutter_theme/src/styles/main_style/main_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'basic_input_decoration.dart';

class BasicInput extends StatelessWidget {
  const BasicInput({
    Key? key,
    this.width,
    this.height,
    this.initialValue = '',
    this.controller,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textInputAction,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.enabled,
    this.obscureText = false,
    this.scrollPadding,
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

  final double? width;
  final double? height;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String initialValue;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final TextAlignVertical? textAlignVertical;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final bool? enabled;
  final bool obscureText;
  final EdgeInsets? scrollPadding;
  final Color? cursorColor;
  final AutovalidateMode? autoValidateMode;
  final FormFieldValidator? validator;
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
        height: height,
        width: width,
        child: TextFormField(
          key: key,
          controller: controller,
          focusNode: focusNode,
          initialValue: initialValue,
          textAlign: textAlign,
          textInputAction: textInputAction,
          textAlignVertical: textAlignVertical,
          keyboardType: keyboardType,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          enabled: enabled,
          obscureText: obscureText,
          cursorColor: cursorColor,
          scrollPadding: scrollPadding ??
              EdgeInsets.symmetric(
                horizontal: BasicPaddings().p18,
                vertical: BasicPaddings().p12,
              ),
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
            contentPadding: contentPadding,
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
            hintStyle: hintStyle,
            errorText: errorText,
            errorMaxLines: errorMaxLines,
            errorStyle: errorStyle,
          ),
        ),
      );
}
