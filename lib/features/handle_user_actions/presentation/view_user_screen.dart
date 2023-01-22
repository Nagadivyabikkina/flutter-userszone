import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userdatabase/features/core/mixins/generic_empty_error_state_widget.dart';
import 'package:userdatabase/features/core/utils/extensions.dart';
import 'package:userdatabase/features/handle_user_actions/application/application.dart';
import 'package:userdatabase/features/handle_user_actions/domain/entities/user_info_entity.dart';
import 'package:userdatabase/features/handle_user_actions/presentation/edit_profile_screen.dart';
import 'package:userdatabase/router/app_navigator_service.dart';

import '../../../core/app_initializers.dart';
import '../../../router/routes.dart';
import '../../core/widgets/base_scaffold.dart';

class ViewUserScreenArgs {
  const ViewUserScreenArgs({
    required this.userId,
    required this.title,
  });
  final int? userId;
  final String? title;
}

class ViewUserScreen extends ConsumerStatefulWidget {
  const ViewUserScreen({this.args, Key? key}) : super(key: key);
  final ViewUserScreenArgs? args;

  @override
  ConsumerState<ViewUserScreen> createState() => _ViewUserScreenState();
}

class _ViewUserScreenState extends ConsumerState<ViewUserScreen>
    with GenericErrorStateWidget {
  @override
  void initState() {
    super.initState();
    ref
        .read(fetchUserStateProvider.notifier)
        .fetchUserById(widget.args!.userId!);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBarTitle: 'Profile',
        body: ref.watch(fetchUserStateProvider).maybeWhen(
            fetchSuccess: (UserInfoEntity response) => bodyWidget(response),
            error: () => showGenericErrorStateWidget(context),
            orElse: () {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              ));
            }));
  }

  Widget bodyWidget(UserInfoEntity userInfo) {
    return ListView(children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.red.shade300,
                minRadius: 35.0,
                child: const Icon(
                  Icons.email,
                  size: 30.0,
                ),
              ),
              Center(
                  child: Stack(children: [
                TextAvatar(
                  size: 80,
                  shape: Shape.Circular,
                  text: userInfo.name,
                  numberLetters: 2,
                  fontSize: 30,
                  upperCase: true,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: editIcon(userInfo),
                )
              ])),
              CircleAvatar(
                backgroundColor: Colors.red.shade300,
                minRadius: 35.0,
                child: const Icon(
                  Icons.message,
                  size: 30.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Name: ${userInfo.name}',
            style: context.style.subhead1.copyWith(fontSize: 15),
          ),
          const SizedBox(height: 10),
          Text(
            'Email : ${userInfo.email}',
            style: context.style.subhead1.copyWith(fontSize: 15),
          ),
          addRadioButton(userInfo.gender),
          const SizedBox(height: 5),
          Text(widget.args?.title ?? '', style: context.style.subhead1),
          const SizedBox(height: 10),
          Divider(color: context.color.tertiary5, endIndent: 15, indent: 15),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocalizations.of(context)!.textAbout,
                      textAlign: TextAlign.left,
                      style: context.style.subhead4,
                    )),
                const SizedBox(height: 10),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocalizations.of(context)!.textAboutFlutterDeveloper,
                      textAlign: TextAlign.left,
                      style: context.style.body4
                          .copyWith(color: context.color.tertiary5),
                    )),
              ])),
        ],
      ),
    ]);
  }

  Row addRadioButton(String gender) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          activeColor: context.color.secondary1,
          value: gender,
          groupValue: gender,
          onChanged: (dynamic value) {},
        ),
        Text(
          gender,
          style: context.style.body4,
        )
      ],
    );
  }

  Widget editIcon(UserInfoEntity userInfo) {
    return InkWell(
        onTap: () {
          getIt<AppNavigationService>().pushNamedRoute(Routes.editUserScreen,
              context: context,
              arguments: EditUserScreenArgs(
                title: widget.args?.title,
                email: userInfo.email,
                name: userInfo.name,
                gender: userInfo.gender,
                status: userInfo.status,
                userId: widget.args?.userId,
              ));
        },
        child: buildCircle(
          child: buildCircle(
            child: const Icon(
              Icons.edit,
              size: 15,
              color: Colors.black,
            ),
            color: Colors.blue,
            padding: 4,
          ),
          color: Colors.white,
          padding: 3,
        ));
  }

  Widget buildCircle(
      {required Widget child, required Color color, required double padding}) {
    return ClipOval(
        child: Container(
            padding: EdgeInsets.all(padding), color: color, child: child));
  }
}
