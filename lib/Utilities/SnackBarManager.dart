import 'dart:ui';
import 'package:core_ui_components/Mixins/AppStatefulWidget.dart';
import 'package:flutter/material.dart';

class Snackbar {
  static OverlayEntry _ownSnackbar;
  static OverlayState _overlayState;
  static AnimationController _controller;
  static bool _removed = true;
  static show({
    @required BuildContext context,
    @required String text,
    @required Color color,
    int durationInSeconds,
  }) {
    if (Snackbar._controller != null) {
      Snackbar._controller = null;
    }
    _overlayState = Overlay.of(context);

    if (_ownSnackbar != null && !Snackbar._removed) {
      _ownSnackbar.remove();
    }
    _ownSnackbar = new OverlayEntry(
        builder: (context) => OverlLayEntryAnimated(
              snackbarText: text,
              snackBarColor: color,
              seconds: durationInSeconds,
            ));

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _overlayState.insert(_ownSnackbar));

    _removed = false;
  }

  static dismissSnackBar() {
    if (Snackbar._controller != null) _controller.reverse();
  }

  static showDanger({BuildContext context}) {
    Snackbar.show(
        context: context,
        color: Theme.of(context).primaryColor,
        text: 'Error',
        durationInSeconds: 100000);
  }

  static showSuccess({BuildContext context}) {
    Snackbar.show(
        context: context, color: Colors.green[600], text: 'Successful');
  }
}

class OverlLayEntryAnimated extends StatefulWidget {
  final String snackbarText;
  final Color snackBarColor;
  final int seconds;

  OverlLayEntryAnimated(
      {Key key,
      @required this.snackbarText,
      @required this.snackBarColor,
      this.seconds})
      : super(key: key);

  _OverlLayEntryAnimatedState createState() =>
      _OverlLayEntryAnimatedState(this.snackbarText, this.snackBarColor);
}

class _OverlLayEntryAnimatedState
    extends AppStatefulWidget<OverlLayEntryAnimated>
    with SingleTickerProviderStateMixin {
  final String snackbarText;
  final Color snackBarColor;

  bool disposed = false;

  _OverlLayEntryAnimatedState(this.snackbarText, this.snackBarColor);
  Animation<double> animation;

//  double start = (window.physicalSize.height / window.devicePixelRatio) * .94;
//  double end = (window.physicalSize.height / window.devicePixelRatio);

  double end;

  @override
  void initState() {
    super.initState();
    Snackbar._controller = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    end = hp(92);
    if (animation == null) {
      animation =
          Tween(begin: hp(100), end: end).animate(Snackbar._controller)
            ..addListener(() {
              setState(() {});
            });
      Snackbar._controller.forward();
      widget.seconds != null
          ? Future.delayed(Duration(seconds: widget.seconds), () {
              Snackbar._controller.reverse();
            })
          : null;
    }
    return Positioned(
      top: animation.value,
      child: Container(
//        decoration: BoxDecoration(
//            border:
//                Border(top: BorderSide(color: Theme.of(context).primaryColor))),
        child: Scaffold(
          backgroundColor: this.snackBarColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Opacity(
                        opacity: 0.7,
                        child: Text(
                          this.snackbarText,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: InkWell(
                        onTap: () {
                          Snackbar._controller.reverse();
                          Future.delayed(Duration(milliseconds: 450), () {
                            Snackbar._ownSnackbar.remove();
                            Snackbar._removed = true;
                          });
                        },
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child:
                                //  Icon(Icons.close)
                                Text(
                              'Close',
                              style: TextStyle(
                                  height: 2,
                                  decoration: TextDecoration.underline),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        width: wp(100),
        height: hp(100) - end,
      ),
    );
  }
}
