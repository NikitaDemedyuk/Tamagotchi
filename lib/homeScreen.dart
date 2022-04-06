import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/theme/theme_constants.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _isFeed[0] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
            _isFeed[1] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
            _isFeed[2] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
            _isFeed[3] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
            _isFeed[4] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
          ],
        ),
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
            padding: EdgeInsets.all(10.0),
            //color: Colors.tealAccent,
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

  Widget buttonAction(IconData iconInButton, double width, double height,
      double sizeIcon, Color colorButton, int indexButton) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        shape: CircleBorder(),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Icon(
          iconInButton,
          size: sizeIcon,
        ),
      ),
      onPressed: () {
        if (indexButton == 1) {
          if (index == 0) {
            _togglePlay(index);
          } else if (index > 0) {
            --index;
            _togglePlay(index);
          }
        } else if (indexButton == 2) {
          if (index < 5) {
            _toggleFeed(index);
            ++index;
          }
        }
      },
    );
  }

  Widget buttonSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonAction(Icons.videogame_asset, 70, 70, 35.0, Colors.green, 1),
        buttonAction(Icons.set_meal_rounded, 90, 90, 40.0, Colors.blue, 2),
        buttonAction(Icons.videocam, 70, 70, 35.0, Colors.redAccent, 3),
      ],
    );
  }

  Widget buttonsColumn() {
    return Container(
      padding: const EdgeInsets.all(10),
      //color: Colors.amber,
      child: buttonSection(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
