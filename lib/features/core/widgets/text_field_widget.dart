// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userdatabase/features/core/utils/extensions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.label = '',
    this.obscure = false,
    this.initialValue,
    this.isPasswordField = false,
    this.isMaskEyeIcon = true,
    this.isBorder = false,
    this.isOnlyNumber = false,
    this.isEnabled = true,
    this.isValueValidate = false,
    this.isFillColorWhenDisabled = true,
    this.isShowSuffixDoneIcon = false,
    this.controller,
    this.focusNode,
    this.validator,
    this.onTapSuffixIcon,
    this.inputFormatters,
    this.prefixIcon,
    this.onChanged,
    this.isShowError = false,
  }) : super(key: key);

  final String label;
  final bool obscure;
  final bool isMaskEyeIcon;
  final bool isPasswordField;
  final bool isBorder;
  final bool isOnlyNumber;
  final bool isEnabled;
  final bool isShowError;
  final bool isFillColorWhenDisabled;
  final bool isValueValidate;
  final bool isShowSuffixDoneIcon;
  final Widget? prefixIcon;
  final String? initialValue;
  final FocusNode? focusNode;
  final Function()? onTapSuffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outLineInputBorder = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
            color: isValueValidate
                ? context.color.secondary1
                : context.color.outLine1));

    final OutlineInputBorder outLineInputBorderDisabled = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: context.color.outLine1));

    final OutlineInputBorder outLineInputBorderError = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: context.color.primary1));

    final UnderlineInputBorder underlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: context.color.outLine1));

    return TextFormField(
      inputFormatters: inputFormatters,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscure,
      obscuringCharacter: '*',
      enabled: isEnabled,
      validator: validator,
      onChanged: onChanged,
      keyboardType: isOnlyNumber ? TextInputType.number : null,
      style: context.style.body3.copyWith(color: context.color.tertiary3),
      initialValue: isEnabled ? initialValue : null,
      decoration: InputDecoration(
        label: !isEnabled && (initialValue?.isNotEmpty ?? false)
            ? Text(initialValue ?? '',
                style: context.style.body3
                    .copyWith(color: context.color.tertiary7))
            : Text(label,
                style: context.style.body3
                    .copyWith(color: context.color.tertiary7)),
        fillColor: !isEnabled && isFillColorWhenDisabled
            ? context.isDark
                ? context.color.tertiary15
                : context.color.tertiary10
            : context.color.tertiary15,
        filled: true,
        border: isBorder ? outLineInputBorder : underlineInputBorder,
        disabledBorder: isBorder
            ? isValueValidate
                ? outLineInputBorder
                : outLineInputBorderDisabled
            : underlineInputBorder,
        enabledBorder: isBorder ? outLineInputBorder : underlineInputBorder,
        errorBorder: isBorder ? outLineInputBorderError : underlineInputBorder,
        focusedErrorBorder:
            isBorder ? outLineInputBorderError : underlineInputBorder,
        focusedBorder: isBorder
            ? outLineInputBorder
            : UnderlineInputBorder(
                borderSide: BorderSide(color: context.color.outLine1)),
        prefixIcon: prefixIcon,
        errorStyle: isShowError
            ? context.style.callout1.copyWith(
                fontSize: 12.5,
                letterSpacing: 0.3,
                color: context.color.primary1)
            : const TextStyle(height: 0, color: Colors.transparent),
        errorMaxLines: 2,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      cursorColor: Colors.grey,
    );
  }
}
