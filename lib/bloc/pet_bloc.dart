import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamagotchi/model/pet.dart';

class PetBloc {

  final _name = BehaviorSubject<String>();
  final _indexFeed = BehaviorSubject<int>();
  final _indexHappy = BehaviorSubject<int>();
  final _timeToFeed = BehaviorSubject<int>();

  Stream<String> get name => _name.stream;
  Stream<int> get indexFeed => _indexFeed.stream;
  Stream<int> get indexHappy => _indexHappy.stream;
  Stream<int> get timeToFeed => _timeToFeed.stream;

  Function(String) get changeNamePet => _name.sink.add;
  Function(int) get changeIndexFeedPet => _indexFeed.sink.add;
  Function(int) get changeIndexHappyPet => _indexHappy.sink.add;
  Function(int) get changeTimeToFeedPet => _timeToFeed.sink.add;

  savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('indexFeed', _indexFeed.value);
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Object? indexFeed = prefs.get('indexFeed');
    if (kDebugMode) {
      print(indexFeed);
      print(_indexFeed.value);
    }
  }


  dispose() {
   _name.close();
   _indexFeed.close();
   _indexHappy.close();
   _timeToFeed.close();
  }
}

