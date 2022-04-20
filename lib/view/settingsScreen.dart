import 'package:flutter/material.dart';
import 'package:tamagotchi/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      'Light/dark mode',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Switch(
                      value: false,
                      onChanged: (bool value) {

                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
