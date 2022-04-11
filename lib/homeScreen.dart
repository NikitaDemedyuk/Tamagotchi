import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/main.dart';
import 'package:tamagotchi/theme/theme_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _isFeed = [false, false, false, false, false];
  final List _isHappy = [false, false, false, false, false];
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


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

  Widget iconsSectionFeed() {
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

  Widget iconsSectionHappy() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _isHappy[0] ? Icon(Icons.emoji_emotions) : Icon(Icons.emoji_emotions_outlined),
            _isHappy[1] ? Icon(Icons.emoji_emotions) : Icon(Icons.emoji_emotions_outlined),
            _isHappy[2] ? Icon(Icons.emoji_emotions) : Icon(Icons.emoji_emotions_outlined),
            _isHappy[3] ? Icon(Icons.emoji_emotions) : Icon(Icons.emoji_emotions_outlined),
            _isHappy[4] ? Icon(Icons.emoji_emotions) : Icon(Icons.emoji_emotions_outlined),
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
            //color: Colors.tealAccent,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconsSectionHappy(),
                  iconsSectionFeed(),
                ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                'images/ben2011.webp',
                fit: BoxFit.fill,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: AvatarGlow(
                  glowColor: Colors.red,
                  duration: Duration(seconds: 2),
                  child: ElevatedButton(
                    onPressed: (){
                      if (index == 4) {
                        _toggleFeed(index);
                        ++index;
                      }
                      if (index < 4) {
                        _toggleFeed(index);
                        _toggleFeed(index + 1);
                        index += 2;
                      }
                    },
                    child: null,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber.withOpacity(0.01),
                      shape: CircleBorder(),
                    ),
                  ),
                  endRadius: 100,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AvatarGlow(
                  glowColor: Colors.amber,
                  duration: Duration(seconds: 2),
                  child: ElevatedButton(
                      onPressed: (){
                      },
                      child: null,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber.withOpacity(0.01),
                        shape: CircleBorder(),
                      ),
                  ),
                  endRadius: 100,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buttonAction(IconData iconInButton, double width, double height,
      double sizeIcon, int indexButton) {
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
        buttonAction(Icons.videogame_asset, 70, 70, 35.0, 1),
        buttonAction(Icons.set_meal_rounded, 90, 90, 40.0, 2),
        buttonAction(Icons.videocam, 70, 70, 35.0, 3),
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
      appBar: AppBar(
        title: Text('TAMAGOTCHI'),
      ),
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
