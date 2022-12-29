import 'package:flutter/material.dart';

class Palette {
  static const int _palette1PrimaryValue = 0xFF19CD9D;
  static const MaterialColor palette1 = MaterialColor(
    _palette1PrimaryValue,
    <int, Color>{
      50: Color(0xFFE3F9F3),
      100: Color(0xFFBAF0E2),
      200: Color(0xFF8CE6CE),
      300: Color(0xFF5EDCBA),
      400: Color(0xFF3CD5AC),
      500: Color(_palette1PrimaryValue),
      600: Color(0xFF16C895),
      700: Color(0xFF12C18B),
      800: Color(0xFF0EBA81),
      900: Color(0xFF08AE6F),
    },
  );

  static const int _palette2PrimaryValue = 0xFF3151A1;
  static const MaterialColor palette2 = MaterialColor(
    _palette2PrimaryValue,
    <int, Color>{
      50: Color(0xFFE6EAF4),
      100: Color(0xFFC1CBE3),
      200: Color(0xFF98A8D0),
      300: Color(0xFF6F85BD),
      400: Color(0xFF506BAF),
      500: Color(_palette2PrimaryValue),
      600: Color(0xFF2C4A99),
      700: Color(0xFF25408F),
      800: Color(0xFF1F3785),
      900: Color(0xFF132774),
    },
  );
}

class ThemeColors {
  //DarkColors
  static const darkPrimaryColor = Color(0xff19CD9D);
  static const darkBgColor = Color(0xff1A1E36);
  static const dark2 = Color(0xff272D51);
  static const dark3 = Color(0xff9098C8);
  static const dark4 = Color(0xff38406B);
  static const dark5 = Color(0xffDBE5FF);
  static const dark6 = Color(0xff212644);

  //LightColors
  static const lightPrimaryColor = Color(0xff3151A1);
  static const lightBgColor = Color(0xffF6F7FA);
  static const brown1 = Color(0xffA2A8B8);
  static const brown2 = Color(0xff6D778E);
  static const brown3 = Color(0xffEEEFF3);
  static const brown4 = Color(0xffD5D8DF);

  //NotificationColors
  static const darkGreenish = Color(0xff2FDBAE);
  static const lightGreenish = Color(0xff27AE60);
  static const reddish = Color(0xffEB5757);
  static const bluish = Color(0xff3B78FF);
  static const orange = Color(0xffFEAB6F);
}

class Themes {
  //DarkTheme
  static final dark = ThemeData.dark().copyWith(

    scaffoldBackgroundColor: ThemeColors.darkBgColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Palette.palette1,
      brightness: Brightness.dark,
      accentColor: ThemeColors.darkPrimaryColor,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: ThemeColors.dark2,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ThemeColors.dark4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: ThemeColors.dark3,
      titleTextStyle: TextStyle(
        fontSize: 17,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(

      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: ThemeColors.dark3.withOpacity(0.35),
        fontSize: 14,
      ),
      contentPadding: const EdgeInsets.fromLTRB(10, 11, 10, 11),
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeColors.dark3.withOpacity(0.30)),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeColors.dark3.withOpacity(0.90)),
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade700),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade700, width: 1.5),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 47),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, 47),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    toggleableActiveColor: ThemeColors.darkPrimaryColor,
    dialogTheme: DialogTheme(
      backgroundColor: ThemeColors.dark4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dividerColor: ThemeColors.dark3,
    tabBarTheme: TabBarTheme(
      labelColor: ThemeColors.darkPrimaryColor,
      unselectedLabelColor: Colors.white,
    ),
  );

  ////////////////
  // LightTheme //
  ////////////////
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: ThemeColors.lightBgColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Palette.palette2,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: ThemeColors.lightPrimaryColor,
      titleTextStyle: TextStyle(
        fontSize: 17,
        color: ThemeColors.lightPrimaryColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.fromLTRB(10, 11, 10, 11),
      isDense: true,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: ThemeColors.brown1,
        fontSize: 14,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeColors.brown1.withOpacity(0.35)),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeColors.lightPrimaryColor),
        borderRadius: BorderRadius.circular(4),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade700),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade700, width: 1.5),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 47),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, 47),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    toggleableActiveColor: ThemeColors.lightPrimaryColor,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: ThemeColors.lightPrimaryColor,
      unselectedLabelColor: ThemeColors.brown2,
    ),
  );

  static final List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(1.5, 1.5), //(x,y)
      blurRadius: 10,
      spreadRadius: 0.3,
    ),
  ];
}
