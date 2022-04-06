import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      primary: Colors.amber,
      onPrimary: Colors.black,
    )),
    iconTheme: IconThemeData(color: Colors.amber, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      primary: Colors.purple,
      onPrimary: Colors.white,
    )),
    iconTheme: IconThemeData(color: Colors.black, opacity: 0.8),
  );
}