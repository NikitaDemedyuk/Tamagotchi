import 'package:flutter/material.dart';
import 'package:tamagotchi/theme/theme_constants.dart';
import 'package:tamagotchi/main.dart';
import 'package:tamagotchi/homeScreen.dart';
import 'package:tamagotchi/settingsScreen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Will be implemented later',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Avenir',
          ),
        ),
      ),
    );
  }
}
