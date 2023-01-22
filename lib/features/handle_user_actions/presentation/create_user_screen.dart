import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userdatabase/features/core/utils/extensions.dart';

import '../../../core/app_initializers.dart';
import '../../../router/app_navigator_service.dart';
import '../../../router/routes.dart';
import '../../core/widgets/base_scaffold.dart';
import '../../core/widgets/custom_bottom_sheet.dart';
import '../../core/widgets/elevated_button_widget.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/text_field_widget.dart';
import '../application/application.dart';
import '../application/state/create_user_state.dart';

class CreateUserScreen extends ConsumerStatefulWidget {
  const CreateUserScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends ConsumerState<CreateUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _userEmail;
  late final TextEditingController _username;
  bool isEnableContinueButton = false;
  bool _isValid = false;
  List gender = ["Male", "Female", "Other"];
  dynamic select;

  @override
  void initState() {
    _userEmail = TextEditingController();
    _username = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userEmail.dispose();
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    listenToLoginSuccess();
    return BaseScaffold(
        bottomNavigationBarWidget: _fnContinueButton(), body: loginWidget());
  }

  Widget _fnContinueButton() {
    return ElevatedButtonWidget(
        label: AppLocalizations.of(context)!.textContinue,
        isDisabled: !isEnableContinueButton,
        onTap: isEnableContinueButton
            ? () {
                ref.refresh(createUserStateProvider.notifier);
                ref.read(createUserStateProvider.notifier).createUser(
                      email: _userEmail.text,
                      name: _username.text,
                      gender: select,
                    );
              }
            : () {});
  }

  void listenToLoginSuccess() {
    ref.listen(createUserStateProvider,
        (CreateUserState? previous, CreateUserState? next) {
      if (next != null) {
        next.maybeWhen(
            userCreated: () {
              _userEmail.clear();
              _username.clear();
              getIt<AppNavigationService>()
                  .pushNamedRoute(Routes.usersScreen, context: context);
            },
            orElse: () {},
            error: () => showLoginFailed());
      }
    });
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: context.color.secondary1,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (dynamic value) {
            setState(() {
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  void showLoginFailed() {
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

  Widget loginWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        decoration: BoxDecoration(
            color: context.color.tertiary10,
            borderRadius: BorderRadius.circular(20)),
        height: 350,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(children: <Widget>[
          const SizedBox(height: 24),
          Column(children: <Widget>[
            Text(AppLocalizations.of(context)!.textCreateUser,
                style: context.style.subhead1),
          ]),
          const SizedBox(height: 46),
          Form(
            key: _formKey,
            onChanged: () => _onChangeForm(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              CustomTextField(
                label: AppLocalizations.of(context)!.emailAddress,
                isBorder: true,
                controller: _userEmail,
                isMaskEyeIcon: false,
                isShowError: true,
                validator: (String? val) {
                  if ((val?.isEmpty ?? true) || val!.length < 4) {
                    _isValid = false;
                    return AppLocalizations.of(context)!.textEmailIsRequired;
                  } else if (!val.isValidEmail()) {
                    _isValid = false;
                    return AppLocalizations.of(context)!.textEnterValidEmail;
                  } else {
                    _isValid = true;
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: AppLocalizations.of(context)!.textFullName,
                isBorder: true,
                controller: _username,
                isMaskEyeIcon: false,
                isShowError: true,
                validator: (String? val) {
                  if (val?.isEmpty ?? true) {
                    _isValid = false;
                    return AppLocalizations.of(context)!.textEnterFullName;
                  } else {
                    _isValid = true;
                    return null;
                  }
                },
              ),
              Row(
                children: <Widget>[
                  addRadioButton(0, 'Male'),
                  addRadioButton(1, 'Female'),
                  addRadioButton(2, 'Others'),
                ],
              ),
            ]),
          )
        ]),
      ),
    );
  }

  void _onChangeForm() {
    setState(() {
      isEnableContinueButton = false;
      final bool isValid = _formKey.currentState!.validate();
      if (_isValid && isValid) {
        isEnableContinueButton = true;
      }
    });
  }
}
