import 'dart:math';

import 'package:basic_flutter_theme/basic_flutter_theme.dart';
import 'package:flutter/material.dart';

enum BasicDialogType {
  delete,
  warning,
  info,
}

class BasicDialogs {
  const BasicDialogs._();

  static Future<T?> defaultDialog<T>(
    BuildContext context, {
    double? width,
    double? height,
    bool barrierDismissible = true,
    Color? color,
    BoxShape shape = BoxShape.rectangle,
    BorderRadiusGeometry? borderRadius,
    required Widget content,
  }) {
    final widthDefault = min<double>(context.widthScreen, 420.scaleSize);
    return showDialog<T>(
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
            borderRadius: borderRadius ?? BasicCorners.mainCornerBorder,
          ),
          child: content,
        ),
      ),
    );
  }

  static Future<T?> customizeDialog<T>(
    BuildContext context, {
    double? width,
    double? height,
    bool barrierDismissible = true,
    Color? color,
    BoxShape shape = BoxShape.rectangle,
    BorderRadiusGeometry? borderRadius,
    EdgeInsets? padding,
    required String title,
    VoidCallback? onPressedToTitle,
    String? customizeOkText,
    String? customizeCancelText,
    VoidCallback? onOkPressed,
    VoidCallback? onCancelPressed,
    required Widget content,
    bool showFooter = true,
    Widget? customizeFooter,
  }) {
    final widthDefault = min<double>(context.widthScreen, 420.scaleSize);
    final heightDefault = min<double>(context.heightScreen, 500.scaleSize);
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: width ?? widthDefault,
          height: height ?? heightDefault,
          padding: padding ?? EdgeInsets.all(BasicPaddings.mainPadding),
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).cardColor,
            shape: shape,
            borderRadius: borderRadius ?? BasicCorners.mainCornerBorder,
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  onPressedToTitle == null
                      ? BasicTitle(
                          title,
                          titleType: BasicTitleType.level5,
                          color: BasicAppColors.primary,
                        )
                      : BasicButtonGestureDetector(
                          type: BasicButtonGestureDetectorType.customize,
                          onPressed: () {
                            onPressedToTitle();
                          },
                          child: BasicTitle(
                            title,
                            titleType: BasicTitleType.level5,
                            color: BasicAppColors.primary,
                          ),
                        ),
                  VSpace.mainSpace,
                  const BasicDivider(),
                  VSpace.p4,
                  Expanded(child: content),
                  if (showFooter)
                    Padding(
                      padding: EdgeInsets.only(top: BasicPaddings.p4),
                      child: customizeFooter ??
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              BasicButton(
                                onPressed: () {
                                  onCancelPressed?.call();
                                  context.popNavigator();
                                },
                                size: BasicButtonSize.large,
                                text: customizeCancelText ?? 'Cancel',
                                textColor: BasicAppColors.primary,
                              ),
                          HSpace.mainSpace,
                          BasicButton(
                            onPressed: onOkPressed ?? () {},
                            type: BasicButtonType.primary,
                            size: BasicButtonSize.large,
                            text: customizeOkText ?? 'Ok',
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: BasicButtonGestureDetector(
                  type: BasicButtonGestureDetectorType.icon,
                  onPressed: () {
                    onCancelPressed?.call();
                    context.popNavigator();
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: BasicAppColors.primary,
                    size: BasicIconSizes.s24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<T?> optionDialog<T>(
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
      defaultDialog<T>(
        context,
        width: width,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(BasicPaddings.p12),
              decoration: BoxDecoration(
                color: type == BasicDialogType.delete
                    ? BasicAppColors.red
                    : type == BasicDialogType.warning
                        ? BasicAppColors.yellow
                        : BasicAppColors.blueLight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(BasicCorners.mainCorners),
                  topRight: Radius.circular(BasicCorners.mainCorners),
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
                    size: BasicIconSizes.s24,
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
                  padding: EdgeInsets.symmetric(horizontal: BasicPaddings.p12),
                  child: Text(
                    content ?? '',
                    textAlign: TextAlign.center,
                    style: BasicTextStyles.body,
                  ),
                ),
            VSpace.p12,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: BasicPaddings.p12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (type != BasicDialogType.info)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: BasicPaddings.p12),
                        child: BasicButton(
                          onPressed: () {
                            if (onClickButtonLeft != null) {
                              onClickButtonLeft();
                            } else {
                              context.popNavigator();
                            }
                          },
                          type: BasicButtonType.none,
                          size: BasicButtonSize.large,
                          text: buttonCancel ?? 'Cancel',
                          textColor: BasicAppColors.white,
                          background: BasicAppColors.grey,
                        ),
                      ),
                    ),
                  Expanded(
                    child: BasicButton(
                      size: BasicButtonSize.large,
                      type: BasicButtonType.primary,
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
