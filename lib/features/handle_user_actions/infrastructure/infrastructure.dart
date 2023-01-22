// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userdatabase/features/handle_user_actions/infrastructure/apis/raw_update_user_api.dart';

import 'apis/raw_create_user_api.dart';
import 'apis/raw_fetch_user_api.dart';

final createUserApiProvider = Provider<RawCreateUserApi>(
  (ref) => RawCreateUserApi(),
);

final updateUserApiProvider = Provider<RawUpdateUserApi>(
  (ref) => RawUpdateUserApi(),
);

final fetchUserApiProvider = Provider<RawFetchUserApi>(
  (ref) => RawFetchUserApi(),
);
