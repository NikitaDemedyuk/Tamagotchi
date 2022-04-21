import 'dart:async';

class ThemeChanger {

  bool appTheme = false;

  final stateStreamController = StreamController<bool>();
  StreamSink<bool> get counterSink => stateStreamController.sink;
  Stream<bool> get counterStream => stateStreamController.stream;

  final eventStreamController = StreamController<ThemeChoice>();
  StreamSink<ThemeChoice> get eventSink => eventStreamController.sink;
  Stream<ThemeChoice> get eventStream => eventStreamController.stream;

  ThemeChanger() {
    eventStream.listen((event) {
      if (event == ThemeChoice.light) {
        appTheme = true;
      } else if (event == ThemeChoice.dark) {
        appTheme = false;
      }
    });
  }

}



enum ThemeChoice {
  light,
  dark,
}