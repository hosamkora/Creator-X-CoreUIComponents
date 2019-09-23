
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageHeaderModel extends ChangeNotifier {

  String _title = 'Hassan Wahdan';
  String _subtitle = 'Select at least one service';
  InkWell _trailingWidget;

  String get title => _title;

  String get subtitle => _subtitle;

  InkWell get trailingWidget => _trailingWidget;

  set subtitle(String value) {
    _subtitle = value;
    //notifyListeners();
  }

  set title(String value) {
    _title = value;
    //notifyListeners();
  }

  set trailingWidget(InkWell trailing) {
    _trailingWidget = trailing;
    notifyListeners();
  }


}