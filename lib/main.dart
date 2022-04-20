import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamagotchi/bloc/pet_bloc.dart';
import 'package:tamagotchi/view/homeScreen.dart';
import 'package:tamagotchi/view/secondScreen.dart';
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
        home: Scaffold(
          appBar: AppBar(
            title: Text('TAMAGOTCHI'),
          ),
          body: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
            if (state.navbarItem == NavbarItem.home) {
              return HomeScreen();
            } else if (state.navbarItem == NavbarItem.settings) {
              return SecondScreen();
            } else if (state.navbarItem == NavbarItem.profile) {
              return SettingsScreen();
            }
            return Container();
          }),
          bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.index,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'Settings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.home);
                } else if (index == 1) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.settings);
                } else if (index == 2) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.profile);
                }
              },
            );
          }),
        ),
      ),
    );
  }
}
