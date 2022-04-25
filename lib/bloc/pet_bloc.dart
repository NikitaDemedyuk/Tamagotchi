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
  final _timeToFeed = BehaviorSubject<DateTime>();

  Stream<String> get name => _name.stream;
  Stream<int> get indexFeed => _indexFeed.stream;
  Stream<int> get indexHappy => _indexHappy.stream;
  Stream<DateTime> get timeToFeed => _timeToFeed.stream;

  Function(String) get changeNamePet => _name.sink.add;
  Function(int) get changeIndexFeedPet => _indexFeed.sink.add;
  Function(int) get changeIndexHappyPet => _indexHappy.sink.add;
  Function(DateTime) get changeTimeToFeedPet => _timeToFeed.sink.add;

  setTimeToFeed (DateTime timeToFeed) {
    return _timeToFeed.value = timeToFeed;
  }

  savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('feedTime', _timeToFeed.value.toIso8601String());

    if (kDebugMode) {
      print('Save = ${_timeToFeed.value.toIso8601String()}');
    }

  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic timeToFeed = prefs.get('feedTime');

    if (kDebugMode) {
      print('Load = $timeToFeed');
    }
    changeTimeToFeedPet(timeToFeed.parse());
  }

  dispose() {
   _name.close();
   _indexFeed.close();
   _indexHappy.close();
   _timeToFeed.close();
  }
}

