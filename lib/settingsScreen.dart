import 'package:flutter/material.dart';
import 'package:tamagotchi/theme/theme_constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
       return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Light/dark mode'
                    ),
                    Switch(
                        value: light,
                        onChanged: (state) {
                          setState(() {
                            light = state;
                          });
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
