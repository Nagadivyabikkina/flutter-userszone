import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userdatabase/features/core/utils/extensions.dart';
import 'package:userdatabase/features/handle_user_actions/presentation/widgets/continue_button_widget.dart';

import '../../core/widgets/base_scaffold.dart';
import '../../core/widgets/text_field_widget.dart';
import '../application/application.dart';
import 'create_user_screen_listener.dart';

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
    listenToLoginSuccess(
      context: context,
      ref: ref,
      username: _username,
      userEmail: _userEmail,
    );
    return BaseScaffold(
        bottomNavigationBarWidget: ContinueButtonWidget(
          isEnableContinueButton: isEnableContinueButton,
          onTapAction: onContinueButtonTap,
        ),
        body: loginWidget());
  }

  void onContinueButtonTap() {
    ref.refresh(createUserStateProvider.notifier);
    ref.read(createUserStateProvider.notifier).createUser(
          email: _userEmail.text,
          name: _username.text,
          gender: select,
        );
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
