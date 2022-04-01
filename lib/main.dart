import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    title: 'Navigation Basics',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    Widget progressSection = Container(

    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: <Widget>[
            IconButton(
              color: Colors.amber,
              icon: const Icon(Icons.home),
              tooltip: 'Go to home screen',
              onPressed: () {},
            ),
            Text(
              'HOME',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.amber,
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            IconButton(
              color: Colors.amber,
              icon: const Icon(Icons.screen_lock_portrait),
              tooltip: 'Go to home screen',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondScreen()),
                );
              },
            ),
            Text(
              'SECOND SCREEN',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.amber,
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            IconButton(
              color: Colors.amber,
              icon: const Icon(Icons.wb_sunny_outlined),
              tooltip: 'Go to home screen',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectThemeScreen()),
                );
              },
            ),
            Text(
              'THEME',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.amber,
              ),
            )
          ],
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
      ),
      body: Container(
        color: Colors.brown,
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                color: Colors.purple,
                child: buttonSection,
              ),
            ),

            Container(
              height: 70,
              color: Colors.black45,
              child: buttonSection,
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Text(
          'Will be implemented later',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}

class SelectThemeScreen extends StatefulWidget {
  const SelectThemeScreen({Key? key}) : super(key: key);

  @override
  State<SelectThemeScreen> createState() => _SelectThemeScreenState();
}

class _SelectThemeScreenState extends State<SelectThemeScreen> {
  bool _selectLightTheme = true;
  bool _selectDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick an option'),
      ),
      body: Center(
        child: Container(
          color: Colors.yellow,
          margin: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Switch(
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                  value: _selectLightTheme,
                  onChanged: (bool value) {
                    setState(() {
                      _selectLightTheme = value;
                    });
                    Navigator.pop(context, _selectLightTheme);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectLightTheme = false;
                    });
                    Navigator.pop(context, _selectLightTheme);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 100),
                    shape: const CircleBorder(),
                    primary:
                        _selectLightTheme ? Colors.red[500] : Colors.red[300],
                    onPrimary: Colors.white,
                  ),
                  child: const Text(
                    'Dark mode',
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
