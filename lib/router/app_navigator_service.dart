import 'package:flutter/material.dart';

import '../features/core/widgets/progress_widget.dart';

class AppNavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get key => _navigatorKey;

  Future pushNamedRoute(String routeName,
      {BuildContext? context, Object? arguments}) async {
    return (context != null ? Navigator.of(context) : key.currentState)!
        .pushNamed(routeName, arguments: arguments);
  }

  Future popRoute(BuildContext? context) async {
    return (context != null ? Navigator.of(context) : key.currentState)!
        .pop(context);
  }

  void showLoader(BuildContext context) {
    ProgressDialog.showProgress(context);
  }

  void hideLoader(BuildContext context) {
    ProgressDialog.dismiss(context);
  }
}
