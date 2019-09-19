import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Mixins/AppStatelessWidget.dart';

class TitleText extends AppStatelessWidget {
  final String text;

  final bool noTranslation;

  final Color color;

  TitleText(this.text, {this.color, this.noTranslation = false});

  @override
  widgetBuilder(BuildContext context) {
    return Text(
      // handling when no translation was set to true
      noTranslation ? this.text : this.translate(this.text),
      textDirection: this.getTextDirection(),
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
