import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
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

  int indexFeed = 0;
  int indexHappy = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _toggleFeed(int indexFeed) {
    setState(() {
      if (!_isFeed[indexFeed]) {
        _isFeed[indexFeed] = true;
      }
    });
  }

  void _toggleHappy(int indexHappy) {
    setState(() {
      if (!_isHappy[indexHappy]) {
        _isHappy[indexHappy] = true;
      }
    });
  }

  void _togglePlay(int indexPlay) {
    setState(() {
      if (_isFeed[indexPlay]) {
        _isFeed[indexPlay] = false;
      }
    });
  }

  void _toggleSad(int indexHappy) {
    setState(() {
      if (_isHappy[indexHappy]) {
        _isHappy[indexHappy] = false;
      }
    });
  }

  Widget iconsSectionFeed() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Feed bar',
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Arial'
          ),
        ),
        _isFeed[0] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
        _isFeed[1] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
        _isFeed[2] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
        _isFeed[3] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
        _isFeed[4] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
      ],
    );
  }

  Widget iconsSectionHappy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Happy bar',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Arial'
          ),
        ),
        _isHappy[0]
            ? const Icon(Icons.emoji_emotions)
            : const Icon(Icons.emoji_emotions_outlined),
        _isHappy[1]
            ? const Icon(Icons.emoji_emotions)
            : const Icon(Icons.emoji_emotions_outlined),
        _isHappy[2]
            ? const Icon(Icons.emoji_emotions)
            : const Icon(Icons.emoji_emotions_outlined),
        _isHappy[3]
            ? const Icon(Icons.emoji_emotions)
            : const Icon(Icons.emoji_emotions_outlined),
        _isHappy[4]
            ? const Icon(Icons.emoji_emotions)
            : const Icon(Icons.emoji_emotions_outlined),
      ],
    );
  }

  Widget buttonActionOnImage(Color color, double endRadius, double opacity,
      int secondDurtion, int action) {
    return AvatarGlow(
      glowColor: color,
      duration: Duration(seconds: secondDurtion),
      child: ElevatedButton(
        onPressed: () {
          if (action == 1) {
            if (indexHappy < 5) {
              _toggleHappy(indexHappy);
              ++indexHappy;
            }
          }
          if (action == 2) {
            if (indexFeed == 4) {
              _toggleFeed(indexFeed);
              ++indexFeed;
            }
            if (indexFeed < 4) {
              _toggleFeed(indexFeed);
              _toggleFeed(indexFeed + 1);
              indexFeed += 2;
            }
          }

          if (action == 3) {
            if (indexHappy == 0) {
              _toggleSad(indexHappy);
            } else if (indexHappy > 0) {
              --indexHappy;
              _toggleSad(indexHappy);
            }
          }
        },
        child: null,
        style: ElevatedButton.styleFrom(
          primary: Colors.amber.withOpacity(opacity),
          shape: const CircleBorder(),
        ),
      ),
      endRadius: endRadius,
    );
  }

  Widget imageSection() {
    return Image.asset(
      'images/ben2011.webp',
      fit: BoxFit.fill,
    );
  }

  Widget buttonAction(IconData iconInButton, double width, double height,
      double sizeIcon, int indexButton) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        shape: const CircleBorder(),
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
          if (indexFeed == 0) {
            _togglePlay(indexFeed);
          } else if (indexFeed > 0) {
            --indexFeed;
            _togglePlay(indexFeed);
          }
        }
        if (indexButton == 2) {
          if (indexFeed < 5) {
            _toggleFeed(indexFeed);
            ++indexFeed;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TAMAGOTCHI'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconsSectionHappy(),
                  iconsSectionFeed(),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      //color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonAction(Icons.videogame_asset, 70, 70, 35.0, 1),
                          buttonAction(Icons.set_meal_rounded, 90, 90, 40.0, 2),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      //color: Colors.purple,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          imageSection(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child:
                            buttonActionOnImage(Colors.red, 90, 0.01, 2, 3),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: buttonActionOnImage(
                                Colors.red, 120, 0.01, 2, 3),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: buttonActionOnImage(
                                Colors.green, 60, 0.01, 2, 1),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: buttonActionOnImage(
                                Colors.amber, 100, 0.01, 2, 2),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: buttonActionOnImage(
                                Colors.green, 70, 0.01, 2, 1),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: buttonActionOnImage(
                                Colors.green, 70, 0.01, 2, 1),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: buttonActionOnImage(
                                Colors.red, 110, 0.01, 2, 3),
                          ),
                        ],
                      ),
                    ),
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
