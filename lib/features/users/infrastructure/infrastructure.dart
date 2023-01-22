// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userdatabase/features/users/infrastructure/apis/raw_list_of_users_api.dart';

final listOfUsersApiProvider = Provider<RawListOfUsersApi>(
  (ref) => RawListOfUsersApi(),
);
