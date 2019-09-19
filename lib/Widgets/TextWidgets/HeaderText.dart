import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Mixins/AppStatelessWidget.dart';

class HeaderText extends AppStatelessWidget {
  final String text;

  final bool noTranslation;

  final Color color;

  HeaderText(this.text, {this.color, this.noTranslation = false});

  @override
  widgetBuilder(BuildContext context) {
    return Text(
      // handling when no translation was set to true
      noTranslation ? this.text : this.translate(this.text),
      textDirection: this.getTextDirection(),
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
