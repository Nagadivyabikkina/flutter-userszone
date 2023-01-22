import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_access/data_access.dart';
import 'logic/create_user_logic.dart';
import 'logic/fetch_user_logic.dart';
import 'logic/update_user_logic.dart';
import 'state/create_user_state.dart';
import 'state/fetch_user_state.dart';
import 'state/update_user_state.dart';
import 'usercases/create_user_usecases.dart';
import 'usercases/fetch_user_usecases.dart';
import 'usercases/update_user_usecases.dart';

final createUserStateProvider =
    StateNotifierProvider<CreateUserUseCases, CreateUserState>(
  (ref) => CreateUserLogic(
    createUserRepo: ref.watch(createUserRepoProvider),
  ),
);

final updateUserStateProvider =
    StateNotifierProvider<UpdateUserUseCases, UpdateUserState>(
  (ref) => UpdateUserLogic(
    updateUserRepo: ref.watch(updateUserRepoProvider),
  ),
);

final fetchUserStateProvider =
    StateNotifierProvider<FetchUserUserCases, FetchUserState>(
  (ref) => FetchSingleUserLogic(
    fetchUserRepo: ref.watch(fetchUserRepoProvider),
  ),
);
