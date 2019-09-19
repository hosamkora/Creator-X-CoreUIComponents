import '../Widgets/TextWidgets/TitleText.dart';
import 'package:flutter/material.dart';

class LineWithMiddleText extends StatelessWidget {
  final String text;
  final Color color;

  const LineWithMiddleText({Key key, @required this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = color != null ? color : Colors.yellow;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flexible(
          child: Divider(
            color: _color,
            thickness: 1.0,
          ),
          flex: 2,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TitleText(
              text,
              color: _color,
            ),
          ),
        ),
        Flexible(
          child: Divider(
            color: _color,
            thickness: 1,
          ),
          flex: 2,
        ),
      ],
    );
  }
}
