// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infrastructure/infrastructure.dart';
import 'repositories/list_of_users_repository.dart';

final listOfUsersRepoProvider = Provider<ListOfUsersRepository>(
  (ref) => ListOfUsersRepository(
    ref.watch(listOfUsersApiProvider),
  ),
);
