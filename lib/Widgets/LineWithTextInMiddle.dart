import '../Widgets/TextWidgets/TitleText.dart';
import 'package:flutter/material.dart';


class LineWithTextInMiddle extends StatelessWidget {
  final String text;

  const LineWithTextInMiddle({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flexible(
          child: Container(
            color: Colors.yellow,
            width: double.maxFinite,
            height: 1,
          ),
          flex: 2,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TitleText(
              text,
              color: Colors.yellow,
             //padding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
        Flexible(
          child: Container(
            color: Colors.yellow,
            width: double.maxFinite,
            height: 1,
          ),
          flex: 2,
        ),
      ],
    );
  }
}
