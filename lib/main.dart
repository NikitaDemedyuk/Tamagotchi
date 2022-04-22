import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/bloc/pet_bloc.dart';
import 'package:tamagotchi/bloc/theme_bloc.dart';
import 'package:tamagotchi/providers/preference_provider.dart';
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
             return ChangeNotifierProvider(
               create: (BuildContext context) => PreferenceProvider(),
               child: Consumer <PreferenceProvider> (
                 builder: (context, provider, child) {
                   return StreamBuilder <Brightness>(
                     stream: provider.bloc.brightness,
                     builder: (context, snapshot) {
                       if (!snapshot.hasData) return Container();
                       return MaterialApp(
                         theme: ThemeData(
                           primaryColor: Colors.blue,
                           brightness: snapshot.data,
                         ),
                         home: RootScreen(),
                       );
                     }
                   );
                 }
               ),
             );
          }),
      );
  }
}
