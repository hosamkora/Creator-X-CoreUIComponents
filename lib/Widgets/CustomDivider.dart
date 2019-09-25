import 'package:core_ui_components/Mixins/AppStatelessWidget.dart';
import 'package:flutter/material.dart';

class CustomDivider extends AppStatelessWidget {

  final double width, height;
  final Color color;

  CustomDivider({this.width, this.height, this.color});

  @override
  Widget widgetBuilder(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10),
      width: width ?? wp(90),
      height: height ?? hp(0.4),
      decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
