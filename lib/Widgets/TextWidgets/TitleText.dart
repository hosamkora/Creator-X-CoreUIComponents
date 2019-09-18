import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleText extends StatelessWidget {
  final String text;

  final bool noTranslation;

  final Color color;
  final TextDirection textDirection;

  TitleText(this.text,
      {this.color, this.noTranslation = false, this.textDirection});

  @override
  build(BuildContext context) {
    return Text(
      // handling when no translation was set to true
      noTranslation ? this.text : this.text,
      textDirection: this.textDirection,
      style: Theme.of(context).primaryTextTheme.title.copyWith(
            color: this.color ?? Theme.of(context).primaryTextTheme.title.color,
          ),
    );
  }

  static getWidgetStyle(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.primaryTextTheme.headline
        .copyWith(color: Colors.white, fontSize: 28);
  }
}
