import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamagotchi/bloc/pet_bloc.dart';
import 'package:tamagotchi/view/homeScreen.dart';
import 'package:tamagotchi/view/secondScreen.dart';
import 'package:tamagotchi/view/settingsScreen.dart';


void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

final counterBloc = CounterBloc();

class _AppState extends State<App> {

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SecondScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('TAMAGOTCHI'),
            ),
            body: Container(
                  child: _widgetOptions.elementAt(0),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.screen_lock_portrait),
                  label: 'SECOND SCREEN',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wb_sunny_outlined),
                  label: 'THEME',
                ),
              ],
              currentIndex: 0,
              //onTap: _onItemTapped,
            ),
          ),
    );
  }
}
