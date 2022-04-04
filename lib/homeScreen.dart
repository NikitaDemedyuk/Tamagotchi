import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget buttonInHomeScreen(String textInButton) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(75, 75),
        shape: const CircleBorder(),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          textInButton,
          style: TextStyle(
            fontFamily: 'Avenir',
            fontSize: 12.0,
          ),
        ),
      ),
      onPressed: () {
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.brown,
          child: Column(
            children: [
              buttonInHomeScreen('FEED'),
              buttonInHomeScreen('WATER'),
              buttonInHomeScreen('C'),
            ],
          ),
        ),
      ),
    );
  }
}
