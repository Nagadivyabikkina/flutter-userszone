import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_initializers.dart';
import '../../../router/app_navigator_service.dart';
import '../../../router/routes.dart';
import '../../core/widgets/custom_bottom_sheet.dart';
import '../../core/widgets/primary_button.dart';
import '../application/application.dart';
import '../application/state/create_user_state.dart';

void listenToLoginSuccess({
  required WidgetRef ref,
  required BuildContext context,
  required TextEditingController userEmail,
  required TextEditingController username,
}) {
  ref.listen(createUserStateProvider,
      (CreateUserState? previous, CreateUserState? next) {
    if (next != null) {
      next.maybeWhen(
          userCreated: () {
            userEmail.clear();
            username.clear();
            getIt<AppNavigationService>()
                .pushNamedRoute(Routes.usersScreen, context: context);
          },
          orElse: () {},
          error: () => showLoginFailed(context));
    }
  });
}

void showLoginFailed(BuildContext context) {
  CustomBottomSheet.show(
    context,
    title: AppLocalizations.of(context)!.textLoginError,
    isSuccess: false,
    body: Builder(builder: (BuildContext ctx) {
      return Text(
        AppLocalizations.of(context)!.textInvalidCredentials,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.subtitle2,
      );
    }),
    primaryButton: Builder(
      builder: (BuildContext ctx) {
        return PrimaryButton(
          label: AppLocalizations.of(context)!.textCancel,
          onTap: () async {
            Navigator.pop(ctx);
          },
        );
      },
    ),
  );
}
