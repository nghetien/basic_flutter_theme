import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'main_style/main_style.dart';

class BasicAppThemes {
  const BasicAppThemes._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: BasicAppColors().bgPrimaryThemeLight,
    primaryColor: BasicAppColors().primary,
    primaryColorDark: BasicAppColors().primaryDark,
    primaryColorLight: BasicAppColors().primaryLight,
    errorColor: BasicAppColors.red,
    hoverColor: Colors.white54,
    dividerColor: Colors.white54,
    fontFamily: BasicFonts.defaultFont,
    appBarTheme: AppBarTheme(
      color: BasicAppColors().primary,
      iconTheme: const IconThemeData(color: BasicAppColors.white),
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      titleTextStyle: BasicTextStyles.titleLarge.copyWith(color: BasicAppColors.white),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: BasicAppColors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: BasicTextStyles.label.copyWith(color: BasicAppColors().primary),
      labelStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.grey),
      errorStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.red),
      fillColor: BasicAppColors.white,
    ),
    cardTheme: CardTheme(color: BasicAppColors().cardThemeLight),
    cardColor: BasicAppColors().cardThemeLight,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: BasicAppColors().bgPrimaryThemeLight),
    iconTheme: const IconThemeData(color: BasicAppColors.black),
    textTheme: TextTheme(
      subtitle1: BasicTextStyles.body.copyWith(color: BasicAppColors.black),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(BasicAppColors().primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      checkColor: MaterialStateProperty.all(BasicAppColors().primary),
      side: BorderSide(width: 1, color: BasicAppColors().primary),
      splashRadius: 0,
    ),
    toggleableActiveColor: BasicAppColors().primary,
    colorScheme: ColorScheme.light(
      primary: BasicAppColors().primary,
      onPrimary: BasicAppColors.white,
      onSurface: BasicAppColors.black,
    ),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
      },
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: BasicAppColors().bgPrimaryThemeDark,
    primaryColor: BasicAppColors().primary,
    primaryColorDark: BasicAppColors().primaryDark,
    primaryColorLight: BasicAppColors().primaryLight,
    errorColor: BasicAppColors.red,
    dividerColor: Colors.white54,
    fontFamily: BasicFonts.defaultFont,
    appBarTheme: AppBarTheme(
      color: BasicAppColors().bgPrimaryThemeDark,
      iconTheme: const IconThemeData(color: BasicAppColors.white),
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      titleTextStyle: BasicTextStyles.titleLarge.copyWith(color: BasicAppColors.white),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: BasicAppColors().primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: BasicTextStyles.label.copyWith(color: BasicAppColors().primary),
      labelStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.grey),
      errorStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.red),
      fillColor: BasicAppColors().bgSecondaryThemeDark,
    ),
    cardTheme: CardTheme(color: BasicAppColors().cardThemeDark),
    cardColor: BasicAppColors().cardThemeDark,
    canvasColor: BasicAppColors().bgSecondaryThemeDark,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: BasicAppColors().bgPrimaryThemeDark),
    iconTheme: const IconThemeData(color: BasicAppColors.white),
    textTheme: TextTheme(
      subtitle1: BasicTextStyles.body.copyWith(color: BasicAppColors.grey),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dialogBackgroundColor: BasicAppColors().bgSecondaryThemeDark,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(BasicAppColors().primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      checkColor: MaterialStateProperty.all(BasicAppColors().primary),
      side: BorderSide(width: 1, color: BasicAppColors().primary),
      splashRadius: 0,
    ),
    toggleableActiveColor: BasicAppColors().primary,
    colorScheme: ColorScheme.dark(
      primary: BasicAppColors().primary,
      surface: BasicAppColors().bgPrimaryThemeDark,
      onSurface: BasicAppColors.white,
    ),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
