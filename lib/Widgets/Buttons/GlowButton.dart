
import 'package:core_ui_components/Mixins/AppStatelessWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GlowButton extends AppStatelessWidget {

  /// the key of the button
  final Key key;

  /// the child component inside the button
  Widget child;

  /// color of the button and the glow of the button
  final Color color;

  /// button padding
  final EdgeInsetsGeometry padding;

  /// the function that happens when the button is pressed
  final VoidCallback onPressed;

  /// the button elevation
  final double elevation;

  final double verticalPadding;

  final double horizontalPadding;

  final bool circle;

  GlowButton({@required this.onPressed,
    this.key,
    this.child,
    this.color,
    this.verticalPadding,
    this.horizontalPadding,
    this.padding,
    this.elevation,
    this.circle});

  Widget widgetBuilder(BuildContext context) {
    // handling if the child was text widget then just translate it
    if (this.child is Text) {
      this.child = this.translateTextWidget(this.child);
    }

    return Container(
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
          color: this.color ?? Theme.of(context).buttonColor,
          spreadRadius: -10,
          blurRadius: 40,
        )
      ]),
      child: RaisedButton(
        color: this.color ?? Theme.of(context).buttonColor,
        elevation: this.elevation ?? 0,
        padding: this.padding ??
            EdgeInsets.symmetric(
                horizontal: this.horizontalPadding ?? 30,
                vertical: this.verticalPadding ?? 13),
        shape: this.circle == null || !this.circle ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ) : CircleBorder(),
        child: this.child,
        onPressed: this.onPressed,
      ),
    );
  }

  Text translateTextWidget(Text text) {
    return Text(this.translate(text.data));
  }
}
