import 'package:adaptive_theme/adaptive_theme.dart';
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

bool light = true;

class _SettingsScreenState extends State<SettingsScreen> {

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
    );
  }
}
