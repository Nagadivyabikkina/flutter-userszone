import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/elevated_button_widget.dart';

class ContinueButtonWidget extends ConsumerWidget {
  const ContinueButtonWidget(
      {required this.isEnableContinueButton,
      required this.onTapAction,
      Key? key})
      : super(key: key);
  final bool isEnableContinueButton;
  final Function onTapAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButtonWidget(
        label: AppLocalizations.of(context)!.textContinue,
        isDisabled: !isEnableContinueButton,
        onTap: isEnableContinueButton ? () => onTapAction() : () {});
  }
}
