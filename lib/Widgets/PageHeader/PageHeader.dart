import 'package:core_ui_components/Mixins/AppStatelessWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageHeader extends AppStatelessWidget {
  final Color black = Colors.black;
  final Color white = Colors.white;
  final String title, subtitle;
  final InkWell trailingWidget;
  final String image;
  final String defaultImage;

  PageHeader(
      {@required this.title,
      @required this.subtitle,
      @required this.trailingWidget,
      @required this.defaultImage,
      this.image});

  @override
  Widget widgetBuilder(BuildContext context) {
    return Container(
      color: white,
      margin: EdgeInsets.only(top: 30),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: image != null && image.isNotEmpty
                  ? NetworkImage(image)
                  : AssetImage(defaultImage),
            ),
          ),
        ),
        title: Text(
          this.translate(title),
          style: TextStyle(fontSize: 22),
        ),
        subtitle: Text(this.translate(subtitle),
            style: TextStyle(color: Colors.black)),
        trailing: trailingWidget,
      ),
    );
  }
}
