import 'package:flutter/material.dart';
import 'package:tamagotchi/homeScreen.dart';
import 'package:tamagotchi/secondScreen.dart';
import 'package:tamagotchi/settingsScreen.dart';
import 'package:tamagotchi/theme/theme_constants.dart';

void main() {
  runApp(App());
}

int selectedIndex = 0;

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SecondScreen(),
    SettingsScreen(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Theme(
        data: light? MyThemes.darkTheme : MyThemes.lightTheme,
        child: Scaffold(
          body: Container(
            child: _widgetOptions.elementAt(selectedIndex),
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
            currentIndex: selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
