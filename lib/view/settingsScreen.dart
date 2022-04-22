import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/bloc/theme_bloc.dart';
import 'package:tamagotchi/main.dart';
import 'package:tamagotchi/providers/preference_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of<PreferenceProvider>(context).bloc;

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
                  Text(
                      'Light/dark mode',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  StreamBuilder<Brightness>(
                    stream: bloc.brightness,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      return Switch(
                        value: (snapshot.data == Brightness.light) ? false : true,
                        onChanged: (bool value) {
                          if (value) {
                            bloc.changeBrightness(Brightness.dark);
                          } else {
                            bloc.changeBrightness(Brightness.light);
                          }
                          bloc.savePreferences();
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
