import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.teal,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black12,
    ));

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  canvasColor: Color(0xFF3B3D58),
  splashColor: Colors.yellow,
  unselectedWidgetColor: Colors.white60,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black26,
  ),
);

bool _light = false;

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _light ? _lightTheme : _darkTheme,
      home: Scaffold(
        body: Container(
          child: Center(
            child: Switch(
              value: _light,
              onChanged: (state) {
                setState(() {
                  _light = state;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
