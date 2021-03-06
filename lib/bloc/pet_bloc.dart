import 'dart:async';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetBloc {
  final _name = BehaviorSubject<String>();
  final _indexFeed = BehaviorSubject<int>();
  final _isFeed = BehaviorSubject<List<bool>>();
  final _indexHappy = BehaviorSubject<int>();
  final _isHappy = BehaviorSubject<List<bool>>();
  final _feedList = BehaviorSubject<List<DateTime>>();

  Stream<String> get name => _name.stream;
  Stream<int> get indexFeed => _indexFeed.stream;
  Stream<List<bool>> get isFeed => _isFeed.stream;
  Stream<int> get indexHappy => _indexHappy.stream;
  Stream<List<bool>> get isHappy => _isHappy.stream;
  Stream<List<DateTime>> get feedList => _feedList.stream;

  Function(String) get changeNamePet => _name.sink.add;
  Function(int) get changeIndexFeedPet => _indexFeed.sink.add;
  Function(List<bool>) get changeArrayFeed => _isFeed.sink.add;
  Function(int) get changeIndexHappyPet => _indexHappy.sink.add;
  Function(List<bool>) get changeArrayHappy => _isHappy.sink.add;
  Function(List<DateTime>) get changeFeedTimeList => _feedList.sink.add;

  savePreferencesIndexFeed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('indexFeed', _indexFeed.value);
  }

  loadPreferencesIndexFeed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? indexFeed = prefs.getInt('indexFeed');
    String timeFromLastFeedString =
        prefs.getString('lastFeedTime') ?? DateTime.now().toIso8601String();
    int? timeFromLastFeed = DateTime.now()
        .difference(DateTime.parse(timeFromLastFeedString))
        .inMinutes;

    if (indexFeed != null) {
      if (indexFeed > timeFromLastFeed) {
        for (int i = 0; i < timeFromLastFeed; ++i) {
          changeIndexFeedPet(indexFeed - 1);
        }
      } else {
        changeIndexFeedPet(0);
      }
    }
  }

  savePreferencesIsFeed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> isFeedString = [];
    for (int i = 0; i < _isFeed.value.length; ++i) {
      if (_isFeed.value[i] == true) {
        isFeedString.add('1');
      } else {
        isFeedString.add('0');
      }
    }
    await prefs.setStringList('isFeedArray', isFeedString);
  }

  loadPreferencesIsFeed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? isFeed = prefs.getStringList('isFeedArray');

    if (isFeed == null) {
      return;
    }

    List<bool> isFeedBool = [];
    for (int i = 0; i < isFeed.length; ++i) {
      if (isFeed[i] == '1') {
        isFeedBool.add(true);
      } else {
        isFeedBool.add(false);
      }
    }
    int indexFeed = prefs.getInt('indexFeed') ?? 0;
    String timeFromLastFeedString =
        prefs.getString('lastFeedTime') ?? DateTime.now().toIso8601String();
    int? timeFromLastFeed = DateTime.now()
        .difference(DateTime.parse(timeFromLastFeedString))
        .inMinutes;

    if (timeFromLastFeed < 5) {
      for (int i = 0; i < timeFromLastFeed; ++i) {
        if (indexFeed > 0) {
          indexFeed -= 1;
          isFeedBool[indexFeed] = false;
          changeIndexFeedPet(indexFeed);
        }
        if (indexFeed == 0) {
          isFeedBool[indexFeed] = false;
          changeIndexFeedPet(indexFeed);
        }
      }
    } else {
      for (int i = 0; i < 5; ++i) {
        if (indexFeed > 0) {
          isFeedBool[indexFeed - 1] = false;
          indexFeed -= 1;
          changeIndexFeedPet(indexFeed);
        }
        if (indexFeed == 0) {
          isFeedBool[indexFeed] = false;
          changeIndexFeedPet(indexFeed);
        }
      }
    }
    changeArrayFeed(isFeedBool);
  }

  savePreferencesIndexHappy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('indexHappy', _indexHappy.value);
  }

  loadPreferencesIndexHappy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? indexHappy = prefs.getInt('indexHappy');

    if (indexHappy != null) {
      changeIndexHappyPet(indexHappy);
    } else {}
  }

  savePreferencesIsHappy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> isHappyString = [];
    for (int i = 0; i < _isHappy.value.length; ++i) {
      if (_isHappy.value[i] == true) {
        isHappyString.add('1');
      } else {
        isHappyString.add('0');
      }
    }
    await prefs.setStringList('isHappyArray', isHappyString);
  }

  loadPreferencesIsHappy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? isHappy = prefs.getStringList('isHappyArray');

    if (isHappy == null) {
      return;
    }

    List<bool> isHappyBool = [];
    for (int i = 0; i < isHappy.length; ++i) {
      if (isHappy[i] == '1') {
        isHappyBool.add(true);
      } else {
        isHappyBool.add(false);
      }
    }
    changeArrayHappy(isHappyBool);
  }

  savePreferencesFeedTimeList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> feedListString = [];
    for (int i = 0; i < _feedList.value.length; ++i) {
      feedListString.add(_feedList.value[i].toIso8601String());
    }
    await prefs.setStringList('feedTimeList', feedListString);
    await prefs.setString('lastFeedTime', feedListString.last);
  }

  loadPreferencesFeedTimeList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? feedList = prefs.getStringList('feedTimeList');

    List<DateTime> feedListDateTime = [];
    for (int i = 0; i < feedList!.length; ++i) {
      DateTime dateTime = DateTime.parse(feedList[i]);
      feedListDateTime.add(dateTime);
    }
    changeFeedTimeList(feedListDateTime);
  }

  dispose() {
    _name.close();
    _indexFeed.close();
    _isFeed.close();
    _indexHappy.close();
    _isHappy.close();
    _feedList.close();
  }
}
