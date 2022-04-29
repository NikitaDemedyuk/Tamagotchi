import 'package:flutter/cupertino.dart';
import 'package:tamagotchi/bloc/pet_bloc.dart';
import 'package:tamagotchi/model/pet.dart';

class PetProvider with ChangeNotifier {

  Pet pet = Pet('Ben', 0, [false, false, false, false, false], 0, [false, false, false, false, false], []);
  PetBloc _petBloc = PetBloc();

  String get name => pet.name;
  int get indexFeed => pet.indexFeed;
  List <bool> get isFeed => pet.isFeed;
  int get indexHappy => pet.indexHappy;
  List<DateTime> get feedList => pet.feedList;
  PetBloc get petBloc => _petBloc;


  PetProvider() {
    _petBloc = PetBloc();
    _petBloc.loadPreferencesIndexFeed();
    _petBloc.loadPreferencesIsFeed();
    _petBloc.loadPreferencesIndexHappy();
    _petBloc.loadPreferencesIsHappy();
    _petBloc.loadPreferencesFeedTimeList();
  }

  void incrementFeed () {
    if (pet.indexFeed < 5) {
      pet.isFeed[pet.indexFeed] = true;
      pet.indexFeed++;
    }
    notifyListeners();
  }
  
  void decrementFeed () {
    if (pet.indexFeed > 0) {
      pet.isFeed[pet.indexFeed] = false;
      pet.indexFeed--;
    }
    notifyListeners();
  }

  void incrementHappy () {
    if (pet.indexHappy < 5) {
      pet.isHappy[pet.indexHappy] = true;
      pet.indexHappy++;
    }
    notifyListeners();
  }

  void decrementHappy () {
    if (pet.indexHappy > 0) {
      pet.indexHappy--;
      pet.isHappy[pet.indexHappy] = false;
    }
    notifyListeners();
  }

  void resetData() {
    while (pet.indexFeed > 0) {
      pet.indexFeed--;
      pet.isFeed[pet.indexFeed] = false;
    }
    while (pet.indexHappy > 0) {
      pet.indexHappy--;
      pet.isHappy[pet.indexHappy] = false;
    }
    while (pet.feedList.length > 1) {
      pet.feedList.removeAt(0);
    }
    notifyListeners();
  }

  void addElementToFeed(DateTime feedTime) {
    pet.feedList.add(feedTime);
    notifyListeners();
  }
}