import 'dart:async';
import 'package:tamagotchi/model/pet.dart';

enum CounterAction {
  incrementFeed,
  incrementFeedTwo,
  decrementFeed,
  incrementHappy,
  decrementHappy,
  reset,
}

class CounterBloc {

  Pet ben = Pet('Ben', [false, false, false, false, false], [false, false, false, false, false]);

  final stateStreamController = StreamController<Pet>();
  StreamSink<Pet> get counterSink => stateStreamController.sink;
  Stream<Pet> get counterStream => stateStreamController.stream;

  final eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => eventStreamController.sink;
  Stream<CounterAction> get eventStream => eventStreamController.stream;

  CounterBloc() {
    eventStream.listen((event) {
      if (event == CounterAction.incrementFeed) {
        if (ben.indexFeed < 5) {
          ben.isFeed[ben.indexFeed] = true;
          ben.indexFeed++;
        }
      } else if (event == CounterAction.incrementFeedTwo) {
        if (ben.indexFeed == 4) {
         ben.isFeed[ben.indexFeed] = true;
          ben.indexFeed++;
        }
        if (ben.indexFeed < 4) {
          ben.isFeed[ben.indexFeed] = true;
          ben.isFeed[ben.indexFeed + 1] = true;
          ben.indexFeed += 2;
        }

      } else if (event == CounterAction.decrementFeed) {
        if (ben.indexFeed > 0) {
          ben.indexFeed--;
          ben.isFeed[ben.indexFeed] = false;
        }
      } else if (event == CounterAction.incrementHappy) {
        if (ben.indexHappy < 5) {
          ben.isHappy[ben.indexHappy] = true;
          ben.indexHappy++;
        }
      } else if (event == CounterAction.decrementHappy) {
        if (ben.indexHappy > 0) {
          ben.indexHappy--;
          ben.isHappy[ben.indexHappy] = false;
        }
      } else if (event == CounterAction.reset) {
        while (ben.indexFeed > 0) {
          ben.indexFeed--;
          ben.isFeed[ben.indexFeed] = false;
        }
        while (ben.indexHappy > 0) {
          ben.indexHappy--;
          ben.isHappy[ben.indexHappy] = false;
        }
      }
      counterSink.add(ben);
    });
  }

  void dispose() {
    stateStreamController.close();
    eventStreamController.close();
  }

}