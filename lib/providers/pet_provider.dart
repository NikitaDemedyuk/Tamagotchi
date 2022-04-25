import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamagotchi/bloc/pet_bloc.dart';
import 'package:tamagotchi/model/pet.dart';

class PetProvider with ChangeNotifier {

  Pet pet = Pet('Ben', [false, false, false, false, false], [false, false, false, false, false]);
  PetBloc _petBloc = PetBloc();

  String get name => pet.name;
  int get indexFeed => pet.indexFeed;
  int get indexHappy => pet.indexHappy;
  DateTime get timeToFeed => pet.timeToFeed;
  PetBloc get petBloc => _petBloc;

  PetProvider() {
    _petBloc = PetBloc();
    _petBloc.loadPreferences();
  }

  void setTimeToFeed (DateTime timeToFeed) {
    pet.timeToFeed = timeToFeed;
    notifyListeners();
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
      pet.indexFeed--;
      pet.isFeed[pet.indexFeed] = false;
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
    notifyListeners();
  }

}