import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:userdatabase/features/core/utils/extensions.dart';

mixin GenericErrorStateWidget {
  Widget showGenericErrorStateWidget(BuildContext context,
      {String? primaryString, String? secondaryString}) {
    return fnMessageWidget(
        primaryString:
            primaryString ?? AppLocalizations.of(context)!.textServerError,
        secondaryString: secondaryString ??
            AppLocalizations.of(context)!.textPleaseTryAgain);
  }

  Widget fnMessageWidget(
          {required String primaryString, required String secondaryString}) =>
      Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
          child: FittedBox(child: Builder(builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                Text(
                  primaryString,
                  style: context.style.callout2
                      .copyWith(color: context.color.tertiary5),
                ),
                Text(
                  secondaryString,
                  style: context.style.callout2
                      .copyWith(color: context.color.tertiary5),
                ),
              ],
            );
          })),
        ),
      );
}
