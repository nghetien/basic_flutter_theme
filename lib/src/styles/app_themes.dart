part of 'styles.dart';

class BasicAppThemes {
  const BasicAppThemes._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: BasicAppColors.primary,
      onPrimary: BasicAppColors.white,
      onSurface: BasicAppColors.black,
      background: BasicAppColors.bgSecondaryThemeLight,
      onBackground: BasicAppColors.bgPrimaryThemeLight,
      error: BasicAppColors.red,
    ),
    scaffoldBackgroundColor: BasicAppColors.bgPrimaryThemeLight,
    primaryColor: BasicAppColors.primary,
    primaryColorDark: BasicAppColors.primaryDark,
    primaryColorLight: BasicAppColors.primaryLight,
    hoverColor: BasicAppColors.primaryOpacity01,
    splashColor: BasicAppColors.primaryOpacity01,
    highlightColor: BasicAppColors.primaryOpacity01,
    dividerColor: Colors.transparent,
    fontFamily: BasicFonts.defaultFont,
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
        horizontal: BasicPaddings.p8,
        vertical: BasicPaddings.p12,
      ),
      // contentPadding: EdgeInsets.zero,
      enabledBorder: OutlineInputBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        borderSide: BorderSide(
          color: BasicAppColors.greyOpacity04,
          width: BasicBorders.thin,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        borderSide: BorderSide(
          color: BasicAppColors.greyOpacity04,
          width: BasicBorders.thin,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        borderSide: BorderSide(
          color: BasicAppColors.primary,
          width: BasicBorders.thin,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        borderSide: const BorderSide(
          color: BasicAppColors.red,
          width: BasicBorders.thin,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        borderSide: const BorderSide(
          color: BasicAppColors.red,
          width: BasicBorders.thin,
        ),
      ),
      floatingLabelStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.primary),
      labelStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.grey),
      errorStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.red),
    ),
    cardTheme: CardTheme(color: BasicAppColors.cardThemeLight),
    cardColor: BasicAppColors.cardThemeLight,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: BasicAppColors.bgPrimaryThemeLight),
    iconTheme: const IconThemeData(color: BasicAppColors.black),
    textTheme: TextTheme(
      titleMedium: BasicTextStyles.body.copyWith(color: BasicAppColors.black),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(BasicAppColors.primary),
      checkColor: MaterialStateProperty.all(BasicAppColors.primary),
      side: BorderSide(width: BasicBorders.med, color: BasicAppColors.primary),
      splashRadius: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(BasicAppColors.bgSecondaryThemeLight),
        foregroundColor: MaterialStateProperty.all(BasicAppColors.black),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BasicCorners.mainCornerBorder,
          ),
        ),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: BasicAppColors.bgSecondaryThemeLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        side: BorderSide(color: BasicAppColors.greyOpacity02, width: BasicBorders.thin),
      ),
    ),
    menuTheme: MenuThemeData(
      style: MenuStyle(
        backgroundColor: MaterialStateProperty.all(BasicAppColors.bgSecondaryThemeLight),
        surfaceTintColor: MaterialStateProperty.all(BasicAppColors.bgSecondaryThemeLight),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        side: BorderSide(color: BasicAppColors.greyOpacity01, width: BasicBorders.thin),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: BasicAppColors.primary,
      // màu bên phải date picker
      backgroundColor: BasicAppColors.bgSecondaryThemeLight,
      // màu chọn ngày
      headerForegroundColor: BasicAppColors.white,
      // màu chữ
      surfaceTintColor: BasicAppColors.bgSecondaryThemeLight,
      rangePickerShape: RoundedRectangleBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        side: BorderSide(color: BasicAppColors.greyOpacity01, width: BasicBorders.thin),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        side: BorderSide(color: BasicAppColors.greyOpacity01, width: BasicBorders.thin),
      ),
      dayStyle: BasicTextStyles.body,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: BasicAppColors.primary,
      surface: BasicAppColors.bgPrimaryThemeDark,
      onSurface: BasicAppColors.white,
      background: BasicAppColors.bgSecondaryThemeDark,
      onBackground: BasicAppColors.bgPrimaryThemeDark,
      error: BasicAppColors.red,
    ),
    scaffoldBackgroundColor: BasicAppColors.bgPrimaryThemeDark,
    primaryColor: BasicAppColors.primary,
    primaryColorDark: BasicAppColors.primaryDark,
    primaryColorLight: BasicAppColors.primaryLight,
    hoverColor: BasicAppColors.primaryOpacity01,
    splashColor: BasicAppColors.primaryOpacity01,
    highlightColor: BasicAppColors.primaryOpacity01,
    dividerColor: Colors.transparent,
    fontFamily: BasicFonts.defaultFont,
    appBarTheme: AppBarTheme(
      backgroundColor: BasicAppColors.bgSecondaryThemeDark,
      iconTheme: const IconThemeData(color: BasicAppColors.white),
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      titleTextStyle: BasicTextStyles.titleLarge.copyWith(color: BasicAppColors.white),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: BasicAppColors.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      isDense: true,
      fillColor: BasicAppColors.bgPrimaryThemeDark,
      suffixIconColor: BasicAppColors.white,
      contentPadding: EdgeInsets.symmetric(
        horizontal: BasicPaddings.p8,
        vertical: BasicPaddings.p12,
      ),
      // contentPadding: EdgeInsets.zero,
      enabledBorder: OutlineInputBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        borderSide: BorderSide(
          color: BasicAppColors.bgPrimaryThemeDark,
          width: BasicBorders.thin,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        borderSide: BorderSide(
          color: BasicAppColors.greyOpacity04,
          width: BasicBorders.thin,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        borderSide: BorderSide(
          color: BasicAppColors.primary,
          width: BasicBorders.thin,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        borderSide: const BorderSide(
          color: BasicAppColors.red,
          width: BasicBorders.thin,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        borderSide: const BorderSide(
          color: BasicAppColors.red,
          width: BasicBorders.thin,
        ),
      ),
      floatingLabelStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.primary),
      labelStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.grey),
      errorStyle: BasicTextStyles.label.copyWith(color: BasicAppColors.red),
    ),
    cardTheme: CardTheme(color: BasicAppColors.cardThemeDark),
    cardColor: BasicAppColors.cardThemeDark,
    canvasColor: BasicAppColors.bgSecondaryThemeDark,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: BasicAppColors.bgPrimaryThemeDark),
    iconTheme: const IconThemeData(color: BasicAppColors.white),
    textTheme: TextTheme(
      titleMedium: BasicTextStyles.body.copyWith(color: BasicAppColors.white),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dialogBackgroundColor: BasicAppColors.bgSecondaryThemeDark,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(BasicAppColors.primary),
      checkColor: MaterialStateProperty.all(BasicAppColors.primary),
      side: BorderSide(width: BasicBorders.med, color: BasicAppColors.primary),
      splashRadius: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(BasicAppColors.bgSecondaryThemeDark),
        foregroundColor: MaterialStateProperty.all(BasicAppColors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BasicCorners.mainCornerBorder,
          ),
        ),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: BasicAppColors.bgSecondaryThemeDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        side: BorderSide(color: BasicAppColors.greyOpacity02, width: BasicBorders.thin),
      ),
    ),
    menuTheme: MenuThemeData(
      style: MenuStyle(
        backgroundColor: MaterialStateProperty.all(BasicAppColors.bgPrimaryThemeDark),
        surfaceTintColor: MaterialStateProperty.all(BasicAppColors.bgPrimaryThemeDark),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        side: BorderSide(color: BasicAppColors.greyOpacity01, width: BasicBorders.thin),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: BasicAppColors.primary,
      // màu bên phải date picker
      backgroundColor: BasicAppColors.bgSecondaryThemeDark,
      // màu chọn ngày
      headerForegroundColor: BasicAppColors.white,
      // màu chữ
      surfaceTintColor: BasicAppColors.bgSecondaryThemeDark,
      rangePickerShape: RoundedRectangleBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        side: BorderSide(color: BasicAppColors.greyOpacity01, width: BasicBorders.thin),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BasicCorners.mainCornerBorder,
        side: BorderSide(color: BasicAppColors.greyOpacity01, width: BasicBorders.thin),
      ),
      dayStyle: BasicTextStyles.body,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
