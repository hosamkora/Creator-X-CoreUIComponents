import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Mixins/AppStatelessWidget.dart';

class NormalText extends AppStatelessWidget {
  final String text;

  final bool noTranslation;

  final Color color;

  final EdgeInsetsGeometry padding;

  NormalText(this.text, {this.color, this.padding, this.noTranslation = false});

  @override
  widgetBuilder(BuildContext context) {
    return Padding(
      padding: this.padding ?? const EdgeInsets.all(0),
      child: Text(
        // handling when no translation was set to true
        noTranslation ? this.text : this.translate(this.text),
        textDirection: this.getTextDirection(),
        style: Theme.of(context).primaryTextTheme.caption.copyWith(
              color: this.color ??
                  Theme.of(context).primaryTextTheme.caption.color,
            ),
      ),
    );
  }

  static getWidgetStyle(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.primaryTextTheme.caption
        .copyWith(color: Colors.white, fontSize: 17);
  }
}
