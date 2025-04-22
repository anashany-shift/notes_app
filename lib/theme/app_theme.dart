import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Poppins',
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black, showDragHandle: true),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.yellow, fontSize: 20),
      focusColor: Colors.white,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.yellow,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.yellow),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.yellow),
      ),
    ),
    appBarTheme: AppBarTheme(

    )
  );
}
