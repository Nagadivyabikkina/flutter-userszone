// Flutter imports:
import 'package:flutter/material.dart';

class ProgressDialog {
  static bool _isShowing = false;

  static void showProgress(BuildContext context) {
    if (!_isShowing) {
      _isShowing = true;
      Navigator.of(context).push(
        _PopRoute(
          child: const _Progress(
            child: Dialog(
              insetPadding:
                  EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              backgroundColor: Colors.transparent,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  static void dismiss(BuildContext context) {
    if (_isShowing) {
      Navigator.of(context).pop();
      _isShowing = false;
    }
  }

  static void resetProgressState() {
    _isShowing = false;
  }
}

///Widget
class _Progress extends StatelessWidget {
  final Widget child;

  const _Progress({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Center(
          child: child,
        ));
  }
}

class _PopRoute extends PopupRoute {
  final Duration _duration = const Duration(milliseconds: 300);
  Widget child;

  _PopRoute({required this.child});

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
