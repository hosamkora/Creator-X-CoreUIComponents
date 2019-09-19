import '../Widgets/TextWidgets/TitleText.dart';
import 'package:flutter/material.dart';

class LineWithMiddleText extends StatelessWidget {
  final String text;
  final Color color;
  final double textHorizontalPaading;
  final double lineThickness;

  const LineWithMiddleText({
    Key key,
    @required this.text,
    this.color = Colors.yellow,
    this.textHorizontalPaading = 15,
    this.lineThickness = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flexible(
          child: Divider(
            color: color,
            thickness: lineThickness,
          ),
          flex: 2,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: textHorizontalPaading),
            child: TitleText(
              text,
              color: color,
            ),
          ),
        ),
        Flexible(
          child: Divider(
            color: color,
            thickness: lineThickness,
          ),
          flex: 2,
        ),
      ],
    );
  }
}
