import 'package:flutter/material.dart';
import '../TextWidgets/NormalText.dart';

class BackBtn extends StatelessWidget {
  final Function onpress;
  BackBtn({this.onpress});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: this.onpress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.arrow_back_ios, color: Colors.yellow, size: 15),
          SizedBox(width: 5),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: NormalText(
              'Back',
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
