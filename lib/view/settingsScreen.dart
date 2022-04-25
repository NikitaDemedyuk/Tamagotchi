import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/providers/theme_provider.dart';
import 'package:tamagotchi/theme/theme_constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    final themeBloc = Provider.of<ThemeProvider>(context).bloc;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                      'Light/dark mode',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  StreamBuilder<ThemeData>(
                    stream: themeBloc.themeData,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      return Switch(
                        value: (snapshot.data == MyThemes.lightTheme) ? false : true,
                        onChanged: (bool value) {
                          if (value) {
                            themeBloc.changeTheme(MyThemes.darkTheme);
                          } else {
                            themeBloc.changeTheme(MyThemes.lightTheme);
                          }
                          themeBloc.savePreferencesTheme();
                        },
                      );
                    }
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
