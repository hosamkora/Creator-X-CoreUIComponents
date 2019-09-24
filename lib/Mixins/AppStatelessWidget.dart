import 'package:core_ui_components/Configs/Localization/Localization.dart';
import 'package:core_ui_components/Mixins/Platform.dart';
import 'package:flutter/widgets.dart';

abstract class AppStatelessWidget extends StatelessWidget with Platform {
  BuildContext currentContext;

  @override
  Widget build(BuildContext context) {
    this.currentContext = context;
    return this.widgetBuilder(context);
  }

  /// this function is a small replacement to allow to make a layer before build the widget
  Widget widgetBuilder(BuildContext context) {
    return this.getPlatformAction(context);
  }

  /// required to implement if did not reimplement the build() function
  dynamic onAndroid(BuildContext context) {
    throw new Exception(
        'onAndroid method should be implemented if you did not override the buid function');
  }

  /// required to implement if did not reimplement the build() function
  dynamic onIOS(BuildContext context) {
    throw new Exception(
        'onIOS method should be implemented if you did not override the buid function');
  }

  String translate(String word) {
    return AppLocalizations.of(this.currentContext).translate(word);
  }

  TextDirection getTextDirection() {
    return Localizations.of<WidgetsLocalizations>(
            this.currentContext, WidgetsLocalizations)
        .textDirection;
  }
    double wp(double percentage) {
    if (percentage <= 0) throw (Exception("percentage should be postive value"));
    return percentage * MediaQuery.of(currentContext).size.width / 100.0;
  }

  double hp(double percentage) {
    if (percentage <= 0) throw (Exception("percentage should be postive value"));
    return percentage * MediaQuery.of(currentContext).size.height / 100.0;
  }
}
