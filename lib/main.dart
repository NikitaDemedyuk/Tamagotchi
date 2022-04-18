import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamagotchi/bloc/pet_bloc.dart';


void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('TAMAGOTCHI'),
            ),
            body: StreamBuilder(
              stream: counterBloc.counterStream,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        counterBloc.eventSink.add(CounterAction.IncrementFeed);
                      },
                      child: null,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        counterBloc.eventSink.add(CounterAction.DecrementFeed);
                      },
                      child: null,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        counterBloc.eventSink.add(CounterAction.IncrementHappy);
                      },
                      child: null,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        counterBloc.eventSink.add(CounterAction.DecrementHappy);
                      },
                      child: null,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        counterBloc.ben.isFeed[0] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
                        counterBloc.ben.isFeed[1] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
                        counterBloc.ben.isFeed[2] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
                        counterBloc.ben.isFeed[3] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
                        counterBloc.ben.isFeed[4] ? const Icon(Icons.fastfood) : const Icon(Icons.fastfood_outlined),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        counterBloc.ben.isHappy[0] ? const Icon(Icons.emoji_emotions) : const Icon(Icons.emoji_emotions_outlined),
                        counterBloc.ben.isHappy[1] ? const Icon(Icons.emoji_emotions) : const Icon(Icons.emoji_emotions_outlined),
                        counterBloc.ben.isHappy[2] ? const Icon(Icons.emoji_emotions) : const Icon(Icons.emoji_emotions_outlined),
                        counterBloc.ben.isHappy[3] ? const Icon(Icons.emoji_emotions) : const Icon(Icons.emoji_emotions_outlined),
                        counterBloc.ben.isHappy[4] ? const Icon(Icons.emoji_emotions) : const Icon(Icons.emoji_emotions_outlined),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
    );
  }
}
