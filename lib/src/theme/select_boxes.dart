import 'package:flutter/material.dart';

import '../styles/styles.dart';

typedef CustomTitleCheckBox = Widget Function<T>(T item, bool value);

class BasicSelectBoxes {
  const BasicSelectBoxes._();

  /// *** If you want to use [FormBuilder]
  ///
  /// *** Single
  /// * Radio style use [FormBuilderCheckbox]
  /// * Checkbox style use [FormBuilderCheckbox] are wrapped in [CustomSelectBox.singleCheckBox]
  /// and use parameter [isCircle] to change style
  /// because default [FormBuilderCheckbox] is circle
  ///
  /// *** Multiple
  ///
  /// - Select one
  /// * Radio style use [FormBuilderRadioGroup]
  ///
  /// - Select multiple
  /// * Radio style use [FormBuilderCheckboxGroup]
  /// * Checkbox style use [FormBuilderCheckboxGroup] are wrapped in [CustomSelectBox.singleCheckBox]
  /// and use parameter [isCircle] to change style
  /// because default [FormBuilderCheckboxGroup] is circle

  static Widget themeSelectBox({
    required Widget child,
    bool isCircle = true,
    Color? fillColor,
  }) =>
      Theme(
        data: ThemeData(
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(fillColor ?? BasicAppColors().primary),
            shape: isCircle
                ? const CircleBorder()
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      BasicBorders.thin,
                    ),
                  ),
          ),
        ),
        child: child,
      );

  /// with out [FormBuilder]
  static Widget simpleCheckBox({
    required bool value,
    required Function(bool?) onChanged,
    bool isCircle = true,
    Color? activeColor,
    Color? checkColor,
    Color? fillColor,
  }) =>
      themeSelectBox(
        isCircle: isCircle,
        fillColor: fillColor,
        child: Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          checkColor: checkColor,
        ),
      );

  /// with out [FormBuilder]
  static Widget singleCheckBox({
    required Widget title,
    Widget? subtitle,
    Widget? secondary,
    required bool value,
    required Function(bool?)? onChanged,
    bool isCircle = true,
    Color? fillColor,
    Color? activeColor,
    EdgeInsets contentPadding = EdgeInsets.zero,
    ListTileControlAffinity controlAffinity = ListTileControlAffinity.leading,
  }) =>
      themeSelectBox(
        isCircle: isCircle,
        fillColor: fillColor,
        child: CheckboxListTile(
          title: title,
          subtitle: subtitle,
          secondary: secondary,
          activeColor: activeColor,
          contentPadding: contentPadding,
          controlAffinity: controlAffinity,
          value: value,
          onChanged: onChanged,
          dense: true,
        ),
      );
}
