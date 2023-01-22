import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userdatabase/features/core/widgets/base_scaffold.dart';
import 'package:userdatabase/features/handle_user_actions/presentation/view_user_screen.dart';
import 'package:userdatabase/features/users/application/application.dart';
import 'package:userdatabase/features/users/domain/entities/user_entity.dart';

import '../../../core/app_initializers.dart';
import '../../../router/app_navigator_service.dart';
import '../../../router/routes.dart';
import '../../core/mixins/generic_empty_error_state_widget.dart';
import 'widgets/user_tile_widget.dart';

class ListOfUsersScreen extends ConsumerStatefulWidget {
  const ListOfUsersScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListOfUsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends ConsumerState<ListOfUsersScreen>
    with GenericErrorStateWidget {
  @override
  void initState() {
    super.initState();
    ref.read(usersStateProvider.notifier).getUsersList();
  }

  List<String> titles = [
    'Flutter Developer',
    'QA Engineer',
    'Software Consultant',
    'Admin',
    'Embedded Engineer',
    'Hacker',
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBarTitle: AppLocalizations.of(context)!.textUsers,
        body: ref.watch(usersStateProvider).maybeWhen(
            fetchedListOfUsers: (List<UserEntity> listOfUsers) {
          return listOfUsersWidget(listOfUsers);
        }, error: () {
          return showGenericErrorStateWidget(context);
        }, orElse: () {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        }));
  }

  Widget listOfUsersWidget(List<UserEntity> listOfUsers) {
    return ListView.builder(
        key: const Key('loadedList'),
        shrinkWrap: true,
        itemCount: listOfUsers.length,
        itemBuilder: (BuildContext context, int index) {
          UserEntity userAtIndex = listOfUsers[index];
          return InkWell(
              onTap: () => getIt<AppNavigationService>()
                  .pushNamedRoute(Routes.viewUserScreen,
                      arguments: ViewUserScreenArgs(
                        title: titles[index],
                        userId: userAtIndex.id,
                      ),
                      context: context),
              child: UserTileWidget(userInfo: userAtIndex));
        });
  }
}
