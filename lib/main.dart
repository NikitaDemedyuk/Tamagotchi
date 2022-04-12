import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:tamagotchi/homeScreen.dart';
import 'package:tamagotchi/secondScreen.dart';
import 'package:tamagotchi/settingsScreen.dart';
import 'package:tamagotchi/theme/theme_constants.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  int selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SecondScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    // add addListener to update settingsScreen
  }


  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        themeMode: ThemeMode.dark,
        home: Scaffold(
          appBar: AppBar(
            title: Text('TAMAGOTCHI'),
          ),
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
