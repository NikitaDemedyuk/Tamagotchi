import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List _isFeed = [false, false, false, false, false];
  int index = 0;

  void _toggleFeed(int index) {
    setState(() {
      if (!_isFeed[index]) {
        _isFeed[index] = true;
      }
    });
  }

  void _togglePlay(int index) {
    setState(() {
      if (_isFeed[index]) {
        _isFeed[index] = false;
      }
    });
  }


  Widget iconsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _isFeed[0] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
        _isFeed[1] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
        _isFeed[2] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
        _isFeed[3] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
        _isFeed[4] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
      ],
    );
  }

  Widget imageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: iconsSection(),
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
    );
  }

  Widget buttonInHomeScreen(String textInButton, double width, double height, int indexButton) {
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
        if (indexButton == 1) {
          if (index >= 0) {
            _togglePlay(index);
            index--;
          }
        } else if (indexButton == 2) {
          if (index < 5) {
            _toggleFeed(index);
            index++;
          }
        }
      },
    );
  }

  Widget buttonSection () {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonInHomeScreen('PLAY', 70, 70, 1),
        buttonInHomeScreen('FEED', 90, 90, 2),
        buttonInHomeScreen('BBBB', 70, 70, 3),
      ],
    );
  }

  Widget buttonsColumn() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: buttonSection(),
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
                child: buttonsColumn(),
              ),
              Expanded(
                flex: 3,
                child: imageSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
