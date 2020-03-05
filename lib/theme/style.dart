import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color.fromARGB(255, 255, 69, 69),
    accentColor: Colors.black,
    fontFamily: 'Caladea',
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black87),
      subtitle1: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black87),
      bodyText1: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black87),
    ),
  );
}
