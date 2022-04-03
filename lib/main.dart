import 'package:flutter/material.dart';
import 'package:tamagotchi/homeScreen.dart';
import 'package:tamagotchi/secondScreen.dart';
import 'package:tamagotchi/settingsScreen.dart';
import 'package:tamagotchi/theme/theme_constants.dart';
import 'package:tamagotchi/theme/theme_manager.dart';

ThemeManager _themeManager = ThemeManager();

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SecondScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Text('TAMAGOTCHI'),
          actions: [
            Switch(
                value: _themeManager.themeMode == ThemeMode.dark,
                onChanged: (newValue) {
                  _themeManager.toogleTheme(newValue);
                })
          ],
        ),
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
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
          //selectedItemColor: Colors.amber,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
