import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderText extends StatelessWidget {
  final String text;

  final bool noTranslation;

  final Color color;
  final TextDirection textDirection;

  HeaderText(this.text,
      {this.color, this.noTranslation = false, this.textDirection});

  @override
  build(BuildContext context) {
    return Text(
      // handling when no translation was set to true
      noTranslation ? this.text : this.text,
      textDirection: this.textDirection,
      style: Theme.of(context).primaryTextTheme.headline.copyWith(
            color:
                this.color ?? Theme.of(context).primaryTextTheme.headline.color,
          ),
    );
  }

  static TextStyle getWidgetStyle(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.primaryTextTheme.display3.copyWith(
      color: Colors.white,
    );
  }
}
