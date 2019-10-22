import 'package:connectivity/connectivity.dart';

class InternetChecker {
  static Stream<ConnectivityResult> _subscription;
  static bool connected = true;

  _InternetChecker() {
    _subscription = Connectivity().onConnectivityChanged;
  }

  static getInternetLisenter() {
    if (_subscription == null)
      _subscription = Connectivity().onConnectivityChanged;

    return _subscription;
  }
}
