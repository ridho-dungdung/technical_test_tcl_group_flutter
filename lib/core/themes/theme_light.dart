import 'package:flutter/material.dart';

final themeLight = ThemeData(
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue,
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.bold
    ),
    iconTheme: IconThemeData(
      color: Colors.white
    ),
  ),
  dividerTheme: DividerThemeData(
    color: Colors.transparent
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40)
    ),
  )
);