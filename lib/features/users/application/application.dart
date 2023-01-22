import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userdatabase/features/users/application/usecases/list_of_users_usecases.dart';

import '../data_access/data_access.dart';
import 'logic/list_of_users_logic.dart';
import 'state/list_of_users_state.dart';

final usersStateProvider =
    StateNotifierProvider<ListOfUsersUseCases, ListOfUsersState>(
  (ref) => ListOfUsersLogic(
    usersRepo: ref.watch(listOfUsersRepoProvider),
  ),
);
