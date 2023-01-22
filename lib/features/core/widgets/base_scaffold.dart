// Flutter imports:
import 'package:flutter/material.dart';
import 'package:userdatabase/features/core/utils/extensions.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold(
      {required this.body,
      this.label,
      this.left = 0,
      this.right = 0,
      this.isRemoveLineTop = false,
      this.onBackPressed,
      this.leading,
      this.action,
      this.isVehicleImage = false,
      this.maxLinesLabel,
      this.isCenterLabel = false,
      this.resizeToAvoidBottomInset,
      this.dismissibleTopLine = true,
      this.bottomNavigationBarWidget,
      this.paddingBottomNavigation = 8.0,
      this.floatingButton,
      this.appBarTitle,
      Key? key})
      : super(key: key);

  final double left;
  final bool? resizeToAvoidBottomInset;
  final double paddingBottomNavigation;
  final double right;
  final Widget body;
  final String? label;
  final bool isRemoveLineTop;
  final Widget? leading;
  final Widget? action;
  final bool isVehicleImage;
  final bool dismissibleTopLine;

  final int? maxLinesLabel;
  final bool isCenterLabel;

  final Widget? bottomNavigationBarWidget;
  final Widget? floatingButton;
  final VoidCallback? onBackPressed;
  final String? appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [context.color.tertiary15, context.color.tertiary7],
            begin: Alignment.center,
            end: Alignment.topRight,
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          backgroundColor: Colors.transparent,
          bottomNavigationBar: bottomNavigationBarWidget != null
              ? Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom != 0
                          ? 19
                          : 20),
                  child: bottomNavigationBarWidget!)
              : const SizedBox(),
          appBar: AppBar(
              title: Text(appBarTitle ?? ''),
              backgroundColor: context.color.success1),
          body: SafeArea(child: body),
          floatingActionButton: floatingButton,
        ));
  }
}
