import 'package:flutter/material.dart';
import 'package:invitation/utils/colors.dart';

class Themes {
  //light theme
  static final light = ThemeData.light().copyWith(
    primaryColor: AppColor.base,
    primaryColorLight: AppColor.prebase,
    brightness: Brightness.light,
    hoverColor: AppColor.base,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.red,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 228, 222, 222),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 5,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white54,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
  );

  //dark theme
  static final dark = ThemeData.dark().copyWith(
    primaryColor: primaryColorDark,
    primaryColorDark: primaryColorDark,
    brightness: Brightness.dark,

    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: Colors.black54,
    // ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white54,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryColorLight,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blueGrey,
    ),
  );
}
