import 'dart:math';

import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:basic_flutter_theme/src/utils/utils.dart';
import 'package:flutter/material.dart';

import 'buttons/buttons.dart';
import 'spaces.dart';

enum BasicDialogType {
  delete,
  warning,
  info,
}

class BasicDialogs {
  const BasicDialogs._();

  static Future<bool?> defaultDialog(
    BuildContext context, {
    double? width,
    double? height,
    bool barrierDismissible = true,
    Color? color,
    BoxShape shape = BoxShape.rectangle,
    BorderRadiusGeometry? borderRadius,
    required Widget content,
  }) {
    final widthDefault = min<double>(context.width, 350.scaleSize);
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: width ?? widthDefault,
          height: height,
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).cardColor,
            shape: shape,
            borderRadius: borderRadius ?? BasicCorners.cornerBorder5,
          ),
          child: content,
        ),
      ),
    );
  }

  static Future<bool?> optionDialog(
    BuildContext context, {
    required BasicDialogType type,
    required VoidCallback onClickButtonRight,
    VoidCallback? onClickButtonLeft,
    String? title,
    Widget? customTitle,
    String? content,
    String? buttonCancel,
    String? buttonText,
    Widget? customContent,
    double? width,
  }) =>
      defaultDialog(
        context,
        width: width,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(BasicPaddings().p12),
              decoration: BoxDecoration(
                color: type == BasicDialogType.delete
                    ? BasicAppColors.red
                    : type == BasicDialogType.warning
                        ? BasicAppColors.yellow
                        : BasicAppColors.blueLight,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(BasicCorners.corner5),
                  topRight: Radius.circular(BasicCorners.corner5),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    type == BasicDialogType.delete
                        ? Icons.delete
                        : type == BasicDialogType.warning
                            ? Icons.warning
                            : Icons.info,
                    color: Colors.white,
                    size: BasicIconSizes().s24,
                  ),
                  VSpace.p8,
                  customTitle ??
                      Text(
                        title ?? '',
                        textAlign: TextAlign.center,
                        style: BasicTextStyles.titleMedium.copyWith(color: BasicAppColors.white),
                      ),
                ],
              ),
            ),
            VSpace.p12,
            customContent ??
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: BasicPaddings().p12),
                  child: Text(
                    content ?? '',
                    textAlign: TextAlign.center,
                    style: BasicTextStyles.body,
                  ),
                ),
            VSpace.p12,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: BasicPaddings().p12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (type != BasicDialogType.info)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: BasicPaddings().p12),
                        child: BasicButton(
                          isFullColor: true,
                          onPressed: () {
                            if (onClickButtonLeft != null) {
                              onClickButtonLeft();
                            } else {
                              context.popNavigator();
                            }
                          },
                          text: buttonCancel ?? 'Cancel',
                          textColor: BasicAppColors.white,
                          background: BasicAppColors.grey,
                        ),
                      ),
                    ),
                  Expanded(
                    child: BasicButton(
                      isFullColor: true,
                      onPressed: onClickButtonRight,
                      text: buttonText ?? 'OK',
                      background: type == BasicDialogType.delete
                          ? BasicAppColors.red
                          : type == BasicDialogType.warning
                              ? BasicAppColors.yellow
                              : BasicAppColors.blueLight,
                    ),
                  ),
                ],
              ),
            ),
            VSpace.p12,
          ],
        ),
      );
}
