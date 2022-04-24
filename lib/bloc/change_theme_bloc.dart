import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamagotchi/theme/theme_constants.dart';

class ChangeThemeBloc{

  final _theme = BehaviorSubject<ThemeData>();

  Stream<ThemeData> get themeData => _theme.stream;

  Function(ThemeData) get changeTheme => _theme.sink.add;

  savePreferencesTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_theme.value == MyThemes.lightTheme){
      await prefs.setBool('dark', false);
    }  else {
      await prefs.setBool('dark', true);
    }
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Object? darkMode = prefs.get('dark');

    if (darkMode != null){
      (darkMode == false) ? changeTheme(MyThemes.lightTheme) : changeTheme(MyThemes.darkTheme);
    } else {
      changeTheme(MyThemes.lightTheme);
    }
  }

  dispose(){
    _theme.close();
  }
}