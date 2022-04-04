import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.amber,
);

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.pinkAccent,
);



class _SettingsScreenState extends State<SettingsScreen> {

  bool light = false;

  void onSwitchValueChanged(bool state) {
    setState(() {
      light = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light ? _darkTheme : _lightTheme,
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: [
                Switch(
                    value: light,
                    onChanged: (state) {
                      onSwitchValueChanged(state);
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
