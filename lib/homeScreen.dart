import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget buttonInHomeScreen(String textInButton, double width, double height) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        fixedSize: Size(width, height),
        shape: CircleBorder(),

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

  Widget buttonSection () {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonInHomeScreen('AAAA', 70, 70),
        buttonInHomeScreen('FEED', 90, 90),
        buttonInHomeScreen('BBBB', 70, 70),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: buttonSection(),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                        child: Icon(
                          icon:
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        'images/Ben.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
