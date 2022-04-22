import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamagotchi/model/theme.dart';

class PreferenceBloc{

  final _brightness = BehaviorSubject<Brightness>();

  //Getters
  Stream<Brightness> get brightness => _brightness.stream;

  //Setters
  Function(Brightness) get changeBrightness => _brightness.sink.add;

  savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_brightness.value == Brightness.light){
      await prefs.setBool('dark', false);
    }  else {
      await prefs.setBool('dark', true);
    }
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Object? darkMode=prefs.get('dark');
    Object? colorIndex = prefs.get('colorIndex');

    if (darkMode != null){
      (darkMode == false) ? changeBrightness(Brightness.light) : changeBrightness(Brightness.dark);
    } else {
      changeBrightness(Brightness.light);
    }
  }

  dispose(){
    _brightness.close();
  }
}