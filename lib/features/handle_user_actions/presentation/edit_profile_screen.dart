import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userdatabase/features/core/utils/extensions.dart';
import 'package:userdatabase/features/handle_user_actions/application/application.dart';

import '../../../core/app_initializers.dart';
import '../../../router/app_navigator_service.dart';
import '../../core/widgets/base_scaffold.dart';
import '../../core/widgets/custom_bottom_sheet.dart';
import '../../core/widgets/elevated_button_widget.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/text_field_widget.dart';
import '../../users/application/application.dart';
import '../application/state/update_user_state.dart';

class EditUserScreenArgs {
  const EditUserScreenArgs(
      {this.email,
      this.gender,
      required this.userId,
      this.name,
      this.status,
      this.title});
  final String? email;
  final String? gender;
  final String? name;
  final String? status;
  final String? title;
  final int? userId;
}

class EditUserScreen extends ConsumerStatefulWidget {
  final EditUserScreenArgs args;
  const EditUserScreen({required this.args, Key? key}) : super(key: key);
  @override
  ConsumerState<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends ConsumerState<EditUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _userFullName;
  late final TextEditingController _userEmail;
  bool isEnableContinueButton = false;
  bool _isValid = false;
  dynamic select;
  List gender = ["male", "female", "other"];

  @override
  void initState() {
    _userFullName = TextEditingController(text: widget.args.name);
    _userEmail = TextEditingController(text: widget.args.email);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      select = widget.args.gender;
    }); // OK
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _userEmail.dispose();
    _userFullName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    listenToUpdateUserSuccess();
    return BaseScaffold(
        bottomNavigationBarWidget: _fnContinueButton(),
        body: ListView(children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[const SizedBox(height: 50), profileWidget()]),
        ]));
  }

  Widget _fnContinueButton() {
    return ElevatedButtonWidget(
        label: AppLocalizations.of(context)!.textSaveChanges,
        onTap: isEnableContinueButton
            ? () {
                ref.refresh(updateUserStateProvider.notifier);
                ref.read(updateUserStateProvider.notifier).updateUser(
                      email: _userEmail.text,
                      gender: select,
                      name: _userFullName.text,
                      userId: widget.args.userId!,
                    );
              }
            : () {});
  }

  void listenToUpdateUserSuccess() {
    ref.listen(updateUserStateProvider,
        (UpdateUserState? previous, UpdateUserState? next) {
      if (next != null) {
        getIt<AppNavigationService>().showLoader(context);
        next.maybeWhen(
            updateSuccess: () {
              ref.refresh(fetchUserStateProvider.notifier);
              ref.read(usersStateProvider.notifier).getUsersList();
              ref
                  .read(fetchUserStateProvider.notifier)
                  .fetchUserById(widget.args.userId!);
              getIt<AppNavigationService>().hideLoader(context);
              getIt<AppNavigationService>().popRoute(context);
            },
            orElse: () {},
            error: () => showRegistrationFailed());
      }
    });
  }

  void showRegistrationFailed() {
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

  Widget profileWidget() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: <Widget>[
        TextAvatar(
          size: 80,
          shape: Shape.Circular,
          text: widget.args.name,
          numberLetters: 2,
          fontSize: 30,
          upperCase: true,
        ),
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
              controller: _userFullName,
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
            const SizedBox(height: 10),
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
              isEnableContinueButton = true;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  Widget buildCircle(
      {required Widget child, required Color color, required double padding}) {
    return ClipOval(
        child: Container(
            padding: EdgeInsets.all(padding), color: color, child: child));
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
