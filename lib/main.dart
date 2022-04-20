import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamagotchi/bloc/pet_bloc.dart';
import 'package:tamagotchi/view/homeScreen.dart';
import 'package:tamagotchi/view/rootScreen.dart';
import 'package:tamagotchi/view/feedListScreen.dart';
import 'package:tamagotchi/view/settingsScreen.dart';

import 'bloc/screen_bloc.dart';
import 'model/screen.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: RootScreen(),
      ),
    );
  }
}
