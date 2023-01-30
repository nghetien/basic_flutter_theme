import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'main_style/main_style.dart';

class BasicAppThemes {
  const BasicAppThemes._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: BasicAppColors.white,
    primaryColor: BasicAppColors.primary,
    primaryColorDark: BasicAppColors.primary,
    errorColor: Colors.red,
    hoverColor: Colors.white54,
    dividerColor: BasicAppColors.viewLine,
    fontFamily: GoogleFonts.openSans().fontFamily,
    appBarTheme: const AppBarTheme(
      color: BasicAppColors.white,
      iconTheme: IconThemeData(color: BasicAppColors.textPrimary),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    colorScheme: const ColorScheme.light(primary: BasicAppColors.primary),
    cardTheme: const CardTheme(color: Colors.white),
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: BasicAppColors.textPrimary),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: BasicAppColors.white),
    textTheme: const TextTheme(
      button: TextStyle(color: BasicAppColors.primary),
      headline6: TextStyle(color: BasicAppColors.textPrimary),
      subtitle2: TextStyle(color: BasicAppColors.textSecondary),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
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
    scaffoldBackgroundColor: BasicAppColors.appBackgroundDark,
    primaryColor: BasicAppColors.primaryBlack,
    primaryColorDark: BasicAppColors.primaryBlack,
    errorColor: const Color(0xFFCF6676),
    hoverColor: Colors.black12,
    dividerColor: const Color(0xFFDADADA).withOpacity(0.3),
    highlightColor: BasicAppColors.appBackgroundDark,
    fontFamily: GoogleFonts.openSans().fontFamily,
    appBarTheme: const AppBarTheme(
      color: BasicAppColors.appBackgroundDark,
      iconTheme: IconThemeData(color: BasicAppColors.black),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    primaryTextTheme: TextTheme(
      headline6: BasicTextStyles.textMediumDefault.copyWith(color: Colors.white),
      overline: BasicTextStyles.textMediumDefault.copyWith(color: Colors.white),
    ),
    cardTheme: const CardTheme(color: BasicAppColors.cardBackgroundBlackDark),
    cardColor: BasicAppColors.appSecondaryBackground,
    iconTheme: const IconThemeData(color: BasicAppColors.white),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: BasicAppColors.appBackgroundDark),
    textTheme: const TextTheme(
      button: TextStyle(color: BasicAppColors.primaryBlack),
      headline6: TextStyle(color: BasicAppColors.white),
      subtitle2: TextStyle(color: Colors.white54),
    ),
    colorScheme: const ColorScheme.dark(
      primary: BasicAppColors.appBackgroundDark,
      onPrimary: BasicAppColors.cardBackgroundBlackDark,
    ).copyWith(
      secondary: BasicAppColors.white,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
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
