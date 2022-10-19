import 'package:flutter/material.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

final appThemeData = {
  AppTheme.lightTheme: ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
    primarySwatch: Colors.teal,
    backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
      ),
    ),
  ),
  AppTheme.darkTheme: ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color.fromRGBO(50, 50, 50, 1),
    primarySwatch: Colors.teal,
    backgroundColor: const Color.fromRGBO(50, 50, 50, 1),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
};
