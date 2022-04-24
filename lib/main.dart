import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/providers/pet_provider.dart';
import 'package:tamagotchi/providers/preference_provider.dart';
import 'package:tamagotchi/view/rootScreen.dart';
import 'bloc/screen_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: ChangeNotifierProvider(
        create: (BuildContext context) => ThemeProvider(),
        child: Consumer<ThemeProvider>(builder: (context, provider, child) {
          return StreamBuilder<ThemeData>(
              stream: provider.bloc.themeData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();
                return ChangeNotifierProvider(
                  create: (BuildContext context) => PetProvider(),
                  child: MaterialApp(
                    theme: snapshot.data,
                    home: RootScreen(),
                  ),
                );
              });
        }),
      ),
    );
  }
}
