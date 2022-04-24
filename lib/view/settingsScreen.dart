import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/providers/preference_provider.dart';
import 'package:tamagotchi/theme/theme_constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ThemeProvider>(context).bloc;
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
                    stream: bloc.themeData,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      return Switch(
                        value: (snapshot.data == MyThemes.lightTheme) ? false : true,
                        onChanged: (bool value) {
                          if (value) {
                            bloc.changeTheme(MyThemes.darkTheme);
                          } else {
                            bloc.changeTheme(MyThemes.lightTheme);
                          }
                          bloc.savePreferencesTheme();
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
