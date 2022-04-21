import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamagotchi/bloc/pet_bloc.dart';
import 'package:tamagotchi/bloc/theme_bloc.dart';
import 'package:tamagotchi/theme/theme_constants.dart';
import 'package:tamagotchi/theme/theme_manager.dart';
import 'package:tamagotchi/view/homeScreen.dart';
import 'package:tamagotchi/view/rootScreen.dart';
import 'package:tamagotchi/view/feedListScreen.dart';
import 'package:tamagotchi/view/settingsScreen.dart';

import 'bloc/screen_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

ThemeChanger themeChanger = ThemeChanger();

class _AppState extends State<App> {

  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: StreamBuilder(
          stream: themeChanger.counterStream,
          builder: (context, snapshot) {
             return MaterialApp(
               theme: MyThemes.lightTheme,
               darkTheme: MyThemes.darkTheme,
               home: RootScreen(),
            );
          }),
      );
  }
}
