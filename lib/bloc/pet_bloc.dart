import 'dart:async';
import 'dart:developer';
import 'package:tamagotchi/model/pet.dart';

enum CounterAction {
  IncrementFeed,
  DecrementFeed,
  IncrementHappy,
  DecrementHappy,
  Reset,
}

class CounterBloc {

  Pet ben = Pet('Ben', '', [false, false, false, false, false], [false, false, false, false, false]);

  final stateStreamController = StreamController<Pet>();
  StreamSink<Pet> get counterSink => stateStreamController.sink;
  Stream<Pet> get counterStream => stateStreamController.stream;

  final eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => eventStreamController.sink;
  Stream<CounterAction> get eventStream => eventStreamController.stream;

  CounterBloc() {

    eventStream.listen((event) {
      if (event == CounterAction.IncrementFeed) {
        ben.isFeed[ben.indexFeed] = true;
        ben.indexFeed++;
      } else if (event == CounterAction.DecrementFeed) {
        ben.indexFeed--;
        ben.isFeed[ben.indexFeed] = false;
      } else if (event == CounterAction.IncrementHappy) {
        ben.isHappy[ben.indexHappy] = true;
        ben.indexHappy++;
      } else if (event == CounterAction.DecrementHappy) {
        ben.indexHappy--;
        ben.isHappy[ben.indexHappy] = false;
      }
      counterSink.add(ben);
    });
  }

}