import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  setTimeToFeed(DateTime timeToFeed) {
    return _timeToFeed.value = timeToFeed;
  }

  setIndexToFeed(int indexFeed) {
    return _indexFeed.value = indexFeed;
  }

  setIndexToHappy(int indexHappy) {
    return _indexHappy.value = indexHappy;
  }

  savePreferencesFeedTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('feedTime', _timeToFeed.value.toIso8601String());
    if (kDebugMode) {
      print('Save time to feed  = ${_timeToFeed.value.toIso8601String()}');
    }
  }

  loadPreferencesFeedTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? timeToFeed = prefs.getString('feedTime');

    DateTime dateTime = DateTime.parse(timeToFeed ?? '0');

    if (timeToFeed != null) {
      changeTimeToFeedPet(dateTime);
    } else {
      changeTimeToFeedPet(DateTime.now());
    }


    if (kDebugMode) {
      print('Load time to feed = $timeToFeed');
    }
  }

  savePreferencesIndexFeed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('indexFeed', _indexFeed.value);
    if (kDebugMode) {
      print('Save indexFeed  = ${_indexFeed.value}');
    }
  }

  loadPreferencesIndexFeed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? indexFeed = prefs.getInt('indexFeed');

    if (indexFeed != null) {
      changeIndexFeedPet(indexFeed);
    } else {

    }

    if (kDebugMode) {
      print('Load indexFeed = $indexFeed');
    }
  }


  dispose() {
   _name.close();
   _indexFeed.close();
   _indexHappy.close();
   _timeToFeed.close();
  }
}

