import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicAppThemes {
  const BasicAppThemes._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: BasicAppColors().primary,
      onPrimary: BasicAppColors.white,
      onSurface: BasicAppColors.black,
      background: BasicAppColors().bgSecondaryThemeLight,
      onBackground: BasicAppColors().bgPrimaryThemeLight,
      error: BasicAppColors.red,
    ),
    scaffoldBackgroundColor: BasicAppColors().bgPrimaryThemeLight,
    primaryColor: BasicAppColors().primary,
    primaryColorDark: BasicAppColors().primaryDark,
    primaryColorLight: BasicAppColors().primaryLight,
    hoverColor: BasicAppColors().primary.withOpacity(0.1),
    splashColor: BasicAppColors().primary.withOpacity(0.1),
    highlightColor: BasicAppColors().primary.withOpacity(0.1),
    dividerColor: Colors.transparent,
    fontFamily: BasicFonts().defaultFont,
    appBarTheme: AppBarTheme(
      backgroundColor: BasicAppColors.white,
      iconTheme: const IconThemeData(color: BasicAppColors.black),
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      titleTextStyle: BasicTextStyles.titleLarge.copyWith(color: BasicAppColors.white),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: BasicAppColors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      isDense: true,
      fillColor: BasicAppColors.white,
      suffixIconColor: BasicAppColors.black,
      contentPadding: EdgeInsets.symmetric(
        horizontal: BasicPaddings().p8,
        vertical: BasicPaddings().p14,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BasicCorners.cornerBorder5,
        borderSide: BorderSide(
          color: BasicAppColors.greyOpacity04,
          width: BasicBorders.thin,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BasicCorners.cornerBorder5,
        borderSide: BorderSide(
          color: BasicAppColors.greyOpacity04,
          width: BasicBorders.thin,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BasicCorners.cornerBorder5,
        borderSide: BorderSide(
          color: BasicAppColors().primary,
          width: BasicBorders.thin,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BasicCorners.cornerBorder5,
        borderSide: BorderSide(
          color: BasicAppColors.red,
          width: BasicBorders.thin,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BasicCorners.cornerBorder5,
        borderSide: BorderSide(
          color: BasicAppColors.red,
          width: BasicBorders.thin,
        ),
      ),
      floatingLabelStyle: BasicTextStyles.label.copyWith(color: BasicAppColors().primary),
      labelStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.grey),
      errorStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.red),
    ),
    cardTheme: CardTheme(color: BasicAppColors().cardThemeLight),
    cardColor: BasicAppColors().cardThemeLight,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: BasicAppColors().bgPrimaryThemeLight),
    iconTheme: const IconThemeData(color: BasicAppColors.black),
    textTheme: TextTheme(
      titleMedium: BasicTextStyles.body.copyWith(color: BasicAppColors.black),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(BasicAppColors().primary),
      checkColor: MaterialStateProperty.all(BasicAppColors().primary),
      side: BorderSide(width: BasicBorders.med, color: BasicAppColors().primary),
      splashRadius: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(BasicAppColors().bgSecondaryThemeLight),
        foregroundColor: MaterialStateProperty.all(BasicAppColors.black),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BasicCorners.cornerBorder5,
          ),
        ),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: BasicAppColors().bgSecondaryThemeLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BasicCorners.cornerBorder5,
        side: BorderSide(color: BasicAppColors.greyOpacity01, width: BasicBorders.thin),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BasicCorners.cornerBorder5,
        side: BorderSide(color: BasicAppColors.greyOpacity01, width: BasicBorders.thin),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: BasicAppColors().primary,
      surface: BasicAppColors().bgPrimaryThemeDark,
      onSurface: BasicAppColors.white,
      background: BasicAppColors().bgSecondaryThemeDark,
      onBackground: BasicAppColors().bgPrimaryThemeDark,
      error: BasicAppColors.red,
    ),
    scaffoldBackgroundColor: BasicAppColors().bgPrimaryThemeDark,
    primaryColor: BasicAppColors().primary,
    primaryColorDark: BasicAppColors().primaryDark,
    primaryColorLight: BasicAppColors().primaryLight,
    hoverColor: BasicAppColors().primary.withOpacity(0.1),
    splashColor: BasicAppColors().primary.withOpacity(0.1),
    highlightColor: BasicAppColors().primary.withOpacity(0.1),
    dividerColor: Colors.transparent,
    fontFamily: BasicFonts().defaultFont,
    appBarTheme: AppBarTheme(
      backgroundColor: BasicAppColors().bgSecondaryThemeDark,
      iconTheme: const IconThemeData(color: BasicAppColors.white),
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      titleTextStyle: BasicTextStyles.titleLarge.copyWith(color: BasicAppColors.white),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: BasicAppColors().primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      isDense: true,
      fillColor: BasicAppColors().bgPrimaryThemeDark,
      suffixIconColor: BasicAppColors.white,
      contentPadding: EdgeInsets.symmetric(
        horizontal: BasicPaddings().p8,
        vertical: BasicPaddings().p14,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BasicCorners.cornerBorder5,
        borderSide: BorderSide(
          color: BasicAppColors().bgPrimaryThemeDark,
          width: BasicBorders.thin,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BasicCorners.cornerBorder5,
        borderSide: BorderSide(
          color: BasicAppColors.greyOpacity04,
          width: BasicBorders.thin,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BasicCorners.cornerBorder5,
        borderSide: BorderSide(
          color: BasicAppColors().primary,
          width: BasicBorders.thin,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BasicCorners.cornerBorder5,
        borderSide: BorderSide(
          color: BasicAppColors.red,
          width: BasicBorders.thin,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BasicCorners.cornerBorder5,
        borderSide: BorderSide(
          color: BasicAppColors.red,
          width: BasicBorders.thin,
        ),
      ),
      floatingLabelStyle: BasicTextStyles.label.copyWith(color: BasicAppColors().primary),
      labelStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.grey),
      errorStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.red),
    ),
    cardTheme: CardTheme(color: BasicAppColors().cardThemeDark),
    cardColor: BasicAppColors().cardThemeDark,
    canvasColor: BasicAppColors().bgSecondaryThemeDark,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: BasicAppColors().bgPrimaryThemeDark),
    iconTheme: const IconThemeData(color: BasicAppColors.white),
    textTheme: TextTheme(
      titleMedium: BasicTextStyles.body.copyWith(color: BasicAppColors.grey),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dialogBackgroundColor: BasicAppColors().bgSecondaryThemeDark,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(BasicAppColors().primary),
      checkColor: MaterialStateProperty.all(BasicAppColors().primary),
      side: BorderSide(width: BasicBorders.med, color: BasicAppColors().primary),
      splashRadius: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(BasicAppColors().bgSecondaryThemeDark),
        foregroundColor: MaterialStateProperty.all(BasicAppColors.white),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BasicCorners.cornerBorder5,
          ),
        ),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: BasicAppColors().bgSecondaryThemeDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BasicCorners.cornerBorder5,
        side: BorderSide(color: BasicAppColors.greyOpacity01, width: BasicBorders.thin),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BasicCorners.cornerBorder5,
        side: BorderSide(color: BasicAppColors.greyOpacity01, width: BasicBorders.thin),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
