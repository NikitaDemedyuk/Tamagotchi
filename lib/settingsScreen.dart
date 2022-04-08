import 'package:flutter/material.dart';
import 'package:tamagotchi/main.dart';
import 'package:tamagotchi/homeScreen.dart';
import 'package:tamagotchi/secondScreen.dart';
import 'package:tamagotchi/theme/theme_constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

bool light = false;

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: light ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TAMAGOTCHI'),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Light/dark mode'),
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
      ),
    );
  }
}
