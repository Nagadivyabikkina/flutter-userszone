import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_initializers.dart';
import '../../../router/app_navigator_service.dart';
import '../../core/widgets/custom_bottom_sheet.dart';
import '../../core/widgets/primary_button.dart';
import '../../users/application/application.dart';
import '../application/application.dart';
import '../application/state/update_user_state.dart';

void listenToUpdateUserSuccess(
    {required WidgetRef ref,
    required BuildContext context,
    required int userId}) {
  ref.listen(updateUserStateProvider,
      (UpdateUserState? previous, UpdateUserState? next) {
    if (next != null) {
      getIt<AppNavigationService>().showLoader(context);
      next.maybeWhen(
          updateSuccess: () {
            ref.refresh(fetchUserStateProvider.notifier);
            ref.read(usersStateProvider.notifier).getUsersList();
            ref.read(fetchUserStateProvider.notifier).fetchUserById(userId);
            getIt<AppNavigationService>().hideLoader(context);
            getIt<AppNavigationService>().popRoute(context);
          },
          orElse: () {},
          error: () => showRegistrationFailed(context));
    }
  });
}

void showRegistrationFailed(BuildContext context) {
  getIt<AppNavigationService>().hideLoader(context);
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
