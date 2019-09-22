import 'package:core_ui_components/Mixins/AppStatelessWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageHeader extends AppStatelessWidget {
  final Color black = Colors.black;
  final Color white = Colors.white;

  final String title, subtitle;
  final InkWell trailingWidget;

  PageHeader(
      {@required this.title,
      @required this.subtitle,
      @required this.trailingWidget});

  @override
  Widget widgetBuilder(BuildContext context) {
    return Container(
      color: white,
      margin: EdgeInsets.only(top: 30),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: black,
          radius: 30,
        ),
        title: Text(
          this.translate(title),
          style: TextStyle(fontSize: 22),
        ),
        subtitle: Text(this.translate(subtitle)),
        trailing: trailingWidget,
      ),
    );
  }
}
