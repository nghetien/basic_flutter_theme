import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BasicToast {
  const BasicToast._();

  static Future<bool?> toast({
    required String msg,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    ToastGravity? gravity,
    Toast? toastLength,
  }) =>
      Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength ?? Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        webBgColor: '#${backgroundColor.value.toRadixString(16).substring(2, 8)}',
        textColor: textColor,
        fontSize: 16,
      );

  static Future<bool?> success({
    required String msg,
    Color textColor = Colors.white,
    ToastGravity? gravity,
    Toast? toastLength,
  }) =>
      toast(
        msg: msg,
        backgroundColor: BasicAppColors.green,
        textColor: textColor,
        gravity: gravity,
        toastLength: toastLength,
      );

  static Future<bool?> error({
    required String msg,
    Color textColor = Colors.white,
    ToastGravity? gravity,
    Toast? toastLength,
  }) =>
      toast(
        msg: msg,
        backgroundColor: BasicAppColors.red,
        textColor: textColor,
        gravity: gravity,
        toastLength: toastLength,
      );

  static Future<bool?> info({
    required String msg,
    Color textColor = Colors.white,
    ToastGravity? gravity,
    Toast? toastLength,
  }) =>
      toast(
        msg: msg,
        backgroundColor: BasicAppColors.blueLight,
        textColor: textColor,
        gravity: gravity,
        toastLength: toastLength,
      );
}
