// Flutter imports:
import 'package:flutter/material.dart';
import 'package:userdatabase/features/core/theme/color_scheme.dart';
import 'package:userdatabase/features/core/theme/text_theme.dart';
import 'package:userdatabase/features/core/utils/extensions.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    this.icon,
    this.title,
    this.body,
    this.primaryButton,
    this.secondaryButton,
    this.needAFit,
    this.expandToFullHeight = false,
    this.isSuccess = true,
    this.sizedBoxHeight,
    this.paddingContainer = 24,
  }) : super(key: key);
  final String? title;
  final Widget? icon;
  final Widget? body;
  final Widget? primaryButton;
  final Widget? secondaryButton;
  final bool? needAFit;
  final bool isSuccess;
  final bool? expandToFullHeight;
  final double? sizedBoxHeight;
  final double? paddingContainer;

  static void show(
    BuildContext context, {
    String? title,
    Widget? icon,
    Widget? body,
    Widget? primaryButton,
    Widget? secondaryButton,
    double? paddingContainer,
    bool? needAFit,
    bool? expandToFullHeight,
    bool isSuccess = true,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    showModalBottomSheet<void>(
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return CustomBottomSheet(
          title: title,
          icon: icon,
          body: body,
          primaryButton: primaryButton,
          secondaryButton: secondaryButton,
          needAFit: needAFit,
          isSuccess: isSuccess,
          paddingContainer: paddingContainer,
          expandToFullHeight: expandToFullHeight,
        );
      },
    );
  }

  static Future<T?> showAndReturn<T>(
    BuildContext context, {
    String? title,
    Widget? icon,
    Widget? body,
    Widget? primaryButton,
    Widget? secondaryButton,
    double? sizedBoxHeight,
    bool? needAFit,
  }) async {
    return showModalBottomSheet<T?>(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return CustomBottomSheet(
          title: title,
          sizedBoxHeight: sizedBoxHeight,
          body: body,
          primaryButton: primaryButton,
          secondaryButton: secondaryButton,
          needAFit: needAFit,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorSchemeData colorUtil = context.color;
    final TextThemeData textStyleUtil = context.style;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorUtil.tile3,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: builOrientationSpecificWidget(context, [
        Wrap(alignment: WrapAlignment.center, children: <Widget>[
          icon ?? const SizedBox(),
          if (title != null) ...<Widget>{
            buildTitleWidget(textStyleUtil, colorUtil),
          },
          buildBodyWidget(),
        ]),
        const SizedBox(height: 25),
        buildButtonsWidget(),
      ]),
    );
  }

  Widget buildTitleWidget(
      TextThemeData textStyleUtil, ColorSchemeData colorUtil) {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: textStyleUtil.subhead1.copyWith(
                color: isSuccess ? colorUtil.tertiary5 : Colors.red,
              ),
            )));
  }

  Widget buildButtonsWidget() {
    return Column(
      children: [
        secondaryButton ?? const SizedBox(),
        SizedBox(height: sizedBoxHeight ?? 20.0),
        primaryButton ?? const SizedBox(),
      ],
    );
  }

  Widget buildBodyWidget() {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: body != null
            ? ((needAFit ?? true) ? FittedBox(child: body) : body)
            : const SizedBox());
  }

  Widget builOrientationSpecificWidget(
      BuildContext context, List<Widget> children) {
    return MediaQuery.of(context).orientation == Orientation.landscape ||
            (expandToFullHeight ?? false)
        ? ListView(
            children: children,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          );
  }
}
