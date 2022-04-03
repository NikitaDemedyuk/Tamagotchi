import 'package:flutter/material.dart';
import 'package:tamagotchi/theme/theme_constants.dart';
import 'package:tamagotchi/theme/theme_manager.dart';

ThemeManager _themeManager = ThemeManager();

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
      setState(() {

      });
    }
  }

  List<Widget> _widgetOptions = <Widget> [
    Container(

    ),
    Container(
      color: Colors.white12,
      child: Center(
        child: Text(
          'Will be implemented later',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
      ),

    ),
    Container(
      color: Colors.black12,
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.all(20),
        //padding: EdgeInsets.all(30.0),
        child: Text(
          'SETTINGS',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
      ),
    ),
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
          actions: [Switch(value: _themeManager.themeMode == ThemeMode.dark, onChanged: (newValue) {
            _themeManager.toogleTheme(newValue);
          })],
        ),
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem> [
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

