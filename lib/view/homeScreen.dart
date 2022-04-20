import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import '../bloc/pet_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final counterBloc = CounterBloc();

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
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
        counterBloc.ben.isFeed[0] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
        counterBloc.ben.isFeed[1] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
        counterBloc.ben.isFeed[2] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
        counterBloc.ben.isFeed[3] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
        counterBloc.ben.isFeed[4] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
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
        counterBloc.ben.isHappy[0]
            ? const Icon(Icons.emoji_emotions)
            : const Icon(Icons.emoji_emotions_outlined),
        counterBloc.ben.isHappy[1]
            ? const Icon(Icons.emoji_emotions)
            : const Icon(Icons.emoji_emotions_outlined),
        counterBloc.ben.isHappy[2]
            ? const Icon(Icons.emoji_emotions)
            : const Icon(Icons.emoji_emotions_outlined),
        counterBloc.ben.isHappy[3]
            ? const Icon(Icons.emoji_emotions)
            : const Icon(Icons.emoji_emotions_outlined),
        counterBloc.ben.isHappy[4]
            ? const Icon(Icons.emoji_emotions)
            : const Icon(Icons.emoji_emotions_outlined),
      ],
    );
  }

  Widget buttonActionOnImage(Color color, double endRadius, double opacity,
      int secondDuration, int action) {
    return AvatarGlow(
      glowColor: color,
      duration: Duration(seconds: secondDuration),
      child: ElevatedButton(
        onPressed: () {
          if (action == 1) {
            counterBloc.eventSink.add(CounterAction.incrementHappy);
          } else if (action == 2) {
            counterBloc.eventSink.add(CounterAction.incrementFeedTwo);
          } else if (action == 3) {
            counterBloc.eventSink.add(CounterAction.decrementHappy);
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
          counterBloc.eventSink.add(CounterAction.decrementFeed);
        } else if (indexButton == 2) {
          counterBloc.eventSink.add(CounterAction.incrementFeed);
        } else if (indexButton == 3) {
          counterBloc.eventSink.add(CounterAction.reset);
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: counterBloc.counterStream,
        builder: (context, snapshot) {
          return Container(
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
                              buttonAction(Icons.delete_forever, 50, 50, 30.0, 3),
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
                                buttonActionOnImage(
                                    Colors.red, 90, 0.01, 5, 1),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: buttonActionOnImage(
                                    Colors.red, 120, 0.01, 5, 3),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: buttonActionOnImage(
                                    Colors.green, 60, 0.01, 2, 1),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: buttonActionOnImage(
                                    Colors.amber, 100, 0.01, 3, 2),
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
                                    Colors.red, 110, 0.01, 5, 3),
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
          );
        },
      ),
    );
  }
}
