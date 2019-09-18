import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NormalText extends StatelessWidget {
  final String text;

  final bool noTranslation;

  final Color color;

  final EdgeInsetsGeometry padding;

  final TextDirection textDirection;

  NormalText(this.text,
      {this.color,
      this.padding,
      this.noTranslation = false,
      this.textDirection});

  @override
  build(BuildContext context) {
    return Padding(
      padding: this.padding ?? const EdgeInsets.all(0),
      child: Text(
        this.text,
        // handling when no translation was set to true
        // noTranslation ? this.text : this.translate(this.text),
        textDirection: this.textDirection,
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
