import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      primary: Colors.amber,
      onPrimary: Colors.black,
    )),
    appBarTheme: AppBarTheme(
      color: Colors.black12,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black12,
      selectedItemColor: Colors.amber,
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        return Colors.amber[200];
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        return Colors.amber;
      }),
    ),
    iconTheme: IconThemeData(color: Colors.amber, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.purple,
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      primary: Colors.purple,
      onPrimary: Colors.white,
    )),
    appBarTheme: AppBarTheme(
      color: Colors.purple,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.purple,
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        return Colors.purple[200];
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        return Colors.purple;
      }),
    ),
    iconTheme: IconThemeData(color: Colors.black, opacity: 0.8),
  );
}