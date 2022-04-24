import 'dart:async';
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

  savePreferencesFeed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('indexFeed', _indexFeed.value);
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Object? indexFeed = prefs.get('indexFeed');
  }


  dispose() {
   _name.close();
   _indexFeed.close();
   _indexHappy.close();
   _timeToFeed.close();
  }
}