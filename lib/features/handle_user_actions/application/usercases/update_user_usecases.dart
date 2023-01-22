import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/update_user_state.dart';

abstract class UpdateUserUseCases extends StateNotifier<UpdateUserState> {
  UpdateUserUseCases(UpdateUserState state) : super(state);

  Future<void> updateUser({
    required String name,
    required String gender,
    required String email,
    required int userId,
  });
}
