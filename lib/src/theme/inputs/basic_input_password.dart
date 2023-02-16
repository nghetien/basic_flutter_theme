import 'package:basic_flutter_theme/basic_flutter_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicInputPassword extends StatefulWidget {
  const BasicInputPassword({
    Key? key,
    this.iconPasswordColor,
    this.iconPasswordSize,
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

  final double? iconPasswordSize;
  final Color? iconPasswordColor;
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
  State<BasicInputPassword> createState() => _BasicInputPasswordState();
}

class _BasicInputPasswordState extends State<BasicInputPassword> {
  bool _isShowPassword = false;

  Widget _getSuffixIcon() {
    if (widget.suffixIcon != null) return widget.suffixIcon!;
    return BasicIconButtonClearAnimation(
      icon: Icon(
        _isShowPassword ? Icons.visibility_rounded : Icons.visibility_off_rounded,
        color: widget.iconPasswordColor,
        size: widget.iconPasswordSize,
      ),
      onPressed: () => setState(() => _isShowPassword = !_isShowPassword),
    );
  }

  bool _getObscureText() => _isShowPassword ? false : true;

  @override
  Widget build(BuildContext context) => BasicInput(
        width: widget.width,
        height: widget.height,
        controller: widget.controller,
        focusNode: widget.focusNode,
        onFocusChange: widget.onFocusChange,
        initialValue: widget.initialValue,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        enabled: widget.enabled,
        obscureText: _getObscureText(),
        scrollPadding: widget.scrollPadding,
        cursorColor: widget.cursorColor,
        autoValidateMode: widget.autoValidateMode,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        isDense: widget.isDense,
        filled: widget.filled,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _getSuffixIcon(),
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
      );
}
