import 'package:basic_flutter_theme/src/styles/main_style/main_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'basic_input_decoration.dart';

class BasicInput extends StatefulWidget {
  const BasicInput({
    Key? key,
    this.width,
    this.height,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.onFocusChange,
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
  final Function(bool)? onFocusChange;
  final String? initialValue;
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
  State<BasicInput> createState() => _BasicInputState();
}

class _BasicInputState extends State<BasicInput> {
  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(
      () {
        if (widget.onFocusChange != null) {
          widget.onFocusChange!(widget.focusNode!.hasFocus);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: widget.height,
        width: widget.width,
        child: TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          initialValue: widget.initialValue,
          textAlign: widget.textAlign,
          textInputAction: widget.textInputAction,
          textAlignVertical: widget.textAlignVertical,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          enabled: widget.enabled,
          obscureText: widget.obscureText,
          cursorColor: widget.cursorColor,
          scrollPadding: widget.scrollPadding ??
              EdgeInsets.symmetric(
                horizontal: BasicPaddings().p18,
                vertical: BasicPaddings().p12,
              ),
          autovalidateMode: widget.autoValidateMode,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          decoration: basicInputDecoration(
            context,
            enabled: widget.enabled,
            isDense: widget.isDense,
            filled: widget.filled,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            contentPadding: widget.contentPadding,
            focusedBorder: widget.focusedBorder,
            enabledBorder: widget.enabledBorder,
            disabledBorder: widget.disabledBorder,
            errorBorder: widget.errorBorder,
            focusedErrorBorder: widget.focusedErrorBorder,
            fillColor: widget.fillColor,
            hoverColor: widget.hoverColor,
            labelText: widget.labelText,
            labelStyle: widget.labelStyle,
            floatingLabelStyle: widget.floatingLabelStyle,
            floatingLabelBehavior: widget.floatingLabelBehavior,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            errorText: widget.errorText,
            errorMaxLines: widget.errorMaxLines,
            errorStyle: widget.errorStyle,
          ),
        ),
      );
}
