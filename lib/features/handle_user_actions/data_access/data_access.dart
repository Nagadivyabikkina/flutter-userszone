// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userdatabase/features/handle_user_actions/data_access/repositories/default_update_user_repository.dart';

import '../infrastructure/infrastructure.dart';
import 'repositories/default_create_user_repository.dart';
import 'repositories/default_fetch_user_repository.dart';

final createUserRepoProvider = Provider<DefaultCreateUserRepository>(
  (ref) => DefaultCreateUserRepository(
    ref.watch(createUserApiProvider),
  ),
);

final updateUserRepoProvider = Provider<UpdateUserRepo>(
  (ref) => UpdateUserRepo(
    ref.watch(updateUserApiProvider),
  ),
);

final fetchUserRepoProvider = Provider<DefaultFetchUserRepository>(
  (ref) => DefaultFetchUserRepository(
    ref.watch(fetchUserApiProvider),
  ),
);
