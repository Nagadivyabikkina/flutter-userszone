// Flutter imports:
import 'package:flutter/material.dart';
import 'package:userdatabase/features/core/utils/extensions.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
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
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: SizedBox(
          height: 52.0,
          width: width ?? 192.0,
          child: buildElevatedButton(context),
        ),
      ),
    );
  }

  Widget buildElevatedButton(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              isDisabled
                  ? context.color.button2d
                  : context.color.primaryButton2,
            ),
            shape: MaterialStateProperty.all(const StadiumBorder()),
            textStyle:
                MaterialStateProperty.all(const TextStyle(fontSize: 30))),
        onPressed: isDisabled ? null : onTap,
        child: Text(
          label,
          style: context.style.callout2.copyWith(
              color: isDisabled
                  ? context.color.button5a
                  : context.color.primaryButton1),
        ));
  }
}
