
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'TextWidgets/NormalText.dart';

class DialogBox extends StatefulWidget {
  final String title;

  final Widget header;
  final Widget footer;
  final Widget body;
  final List<DialogButton> options;

  const DialogBox({
    Key key,
    @required this.title,
    this.header,
    @required this.body,
    this.footer,
    this.options,
  });

  @override
  State<StatefulWidget> createState() {
    return _StateDialogBox();
  }
}

class _StateDialogBox extends AppStatefulWidget<DialogBox> {
  @override
  Widget widgetBuilder(BuildContext context) {
    final _color = Theme.of(context).primaryColor;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: wp(80),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NormalText(
                widget.title,
                padding: EdgeInsets.all(16),
              ),
              Divider(
                color: _color,
                height: 0,
                thickness: 1,
              ),
              if (widget.header != null) ...getHeader(_color),
              buiildBody(),
              Divider(
                color: _color,
                height: 0,
                thickness: 1,
              ),
              if (widget.footer != null) ...buildFooter(_color),
              if (widget.options != null) decisionOptions(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getHeader(Color _color) {
    return [
      widget.header,
      Opacity(
          opacity: .4, child: Divider(color: _color, height: 0, thickness: .5)),
    ];
  }

  List<Widget> buildFooter(Color _color) {
    return <Widget>[
      widget.footer,
      Opacity(
          opacity: .4, child: Divider(color: _color, height: 0, thickness: .5)),
    ];
  }

  Widget buiildBody() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: hp(30),
      ),
      child: SingleChildScrollView(
        child: widget.body,
      ),
    );
  }

  Widget decisionOptions() {
    if (widget.options == null) return SizedBox(height: 0);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      height: 65,
      child: Row(
        children: <Widget>[
          ...widget.options
              .map((option) => Expanded(flex: 1, child: option))
              .toList(),
        ],
      ),
    );
  }
}

class DialogButton extends AppStatelessWidget {
  final Text text;
  final Color color;
  final GestureTapCallback onTap;

  DialogButton({
    @required this.text,
    @required this.color,
    @required this.onTap,
  });

  @override
  Widget widgetBuilder(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
          color: this.color,
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: text),
    );
  }
}

Future<T> showAnimatedDialog<T>(BuildContext ctx, Widget dialog) {
  return showGeneralDialog<T>(
      barrierColor: Colors.white.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: dialog,
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: ctx,
      pageBuilder: (context, animation1, animation2) {});
}
