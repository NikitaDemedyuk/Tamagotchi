import 'package:flutter/material.dart';
import 'package:tamagotchi/theme/theme_constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

bool _light = false;

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
       return Theme(
         data: _light ? MyThemes.darkTheme : MyThemes.lightTheme,
         child: Scaffold(
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
                          value: _light,
                          onChanged: (state) {
                            setState(() {
                              _light = state;
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
