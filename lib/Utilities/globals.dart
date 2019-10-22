import 'dart:async';

class Globals {
  static StreamController<bool> interNetcontroller = StreamController<bool>.broadcast();

  static StreamSubscription streamSubscription;

  static bool connected = true;
}
