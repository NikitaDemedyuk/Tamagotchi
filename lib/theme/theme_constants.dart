import 'package:flutter/material.dart';


ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.teal,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black12,
    ));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  canvasColor: Color(0xFF3B3D58),
  splashColor: Colors.yellow,
  unselectedWidgetColor: Colors.white60,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black26,
  ),
);

