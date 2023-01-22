import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userdatabase/features/core/utils/extensions.dart';
import 'package:userdatabase/features/handle_user_actions/application/application.dart';
import 'package:userdatabase/features/handle_user_actions/presentation/widgets/continue_button_widget.dart';

import '../../core/widgets/base_scaffold.dart';
import '../../core/widgets/text_field_widget.dart';
import 'edit_profile_screen_listener.dart';
import 'widgets/text_avatar_widget.dart';

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
    if (widget.args.userId != null) {
      listenToUpdateUserSuccess(
          context: context, ref: ref, userId: widget.args.userId!);
    }
    return BaseScaffold(
      appBarTitle: AppLocalizations.of(context)!.textEditProfile,
      bottomNavigationBarWidget: ContinueButtonWidget(
          isEnableContinueButton: isEnableContinueButton,
          onTapAction: onContinueButtonTap),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[const SizedBox(height: 50), profileWidget()],
          ),
        ],
      ),
    );
  }

  Widget profileWidget() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: <Widget>[
        TextAvatarWidget(avatarText: widget.args.name),
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

  void onContinueButtonTap() {
    ref.refresh(updateUserStateProvider.notifier);
    ref.read(updateUserStateProvider.notifier).updateUser(
          email: _userEmail.text,
          gender: select,
          name: _userFullName.text,
          userId: widget.args.userId!,
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
