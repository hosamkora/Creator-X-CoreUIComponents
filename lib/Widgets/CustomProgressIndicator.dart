
import 'package:core_ui_components/Mixins/AppStatelessWidget.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends AppStatelessWidget {
  @override
  Widget widgetBuilder(BuildContext context) {
    return CircularProgressIndicator();
  }
}
