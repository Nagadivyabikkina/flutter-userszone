// Flutter imports:
import 'package:flutter/material.dart';
import 'package:userdatabase/features/core/utils/extensions.dart';

import '../theme/color_scheme.dart';
import '../theme/text_theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.label,
      required this.onTap,
      this.width,
      this.isDisabled = false,
      this.mainAxisAlignment})
      : super(key: key);
  final String label;
  final double? width;
  final VoidCallback onTap;
  final bool isDisabled;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          children: <Widget>[
            buildContainerWithCenterTextWidget(context),
          ]),
    );
  }

  Widget buildContainerWithCenterTextWidget(BuildContext context) {
    final ColorSchemeData colorUtil = context.color;
    final TextThemeData textStyleUtil = context.style;
    return Container(
      height: 52.0,
      width: width ?? 192.0,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: isDisabled ? colorUtil.button2d : colorUtil.primaryButton2,
      ),
      child: Center(
        child: Text(
          label,
          style: textStyleUtil.callout2.copyWith(
              color:
                  isDisabled ? colorUtil.button5a : colorUtil.primaryButton1),
        ),
      ),
    );
  }
}
