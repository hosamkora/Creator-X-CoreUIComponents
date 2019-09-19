import 'package:core_ui_components/Utilities/Constants.dart';
import 'package:flutter/widgets.dart';
import 'dart:io' as Core show Platform;

abstract class Platform {
  dynamic onAndroid(BuildContext context);

  dynamic onIOS(BuildContext context);

  dynamic getPlatformAction(BuildContext context) {
    return this.applyAccordingToPlatform(
      android: this.onAndroid(context),
      ios: this.onIOS(context),
//      forcePlatform: Constants.ANDROID,
    );
  }

  String getPlatform() {
    if (Core.Platform.isAndroid) return Constants.ANDROID;

    if (Core.Platform.isIOS) return Constants.IOS;

    return Constants.ANDROID;
  }

  dynamic applyAccordingToPlatform({
    @required var android,
    @required var ios,
    String forcePlatform = '',
  }) {
    String platform = this.getPlatform();

    if (forcePlatform != '') platform = forcePlatform;

    if (platform == Constants.ANDROID) return android;

    if (platform == Constants.IOS) return ios;
  }
}
