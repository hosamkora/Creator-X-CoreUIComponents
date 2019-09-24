import 'package:core_ui_components/Mixins/AppStatelessWidget.dart';
import 'package:flutter/material.dart';

class CustomDivider extends AppStatelessWidget {
  @override
  Widget widgetBuilder(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10),
      width: wp(90),
      height: hp(0.4),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
