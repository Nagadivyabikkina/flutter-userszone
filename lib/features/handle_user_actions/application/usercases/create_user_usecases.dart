import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/create_user_state.dart';

abstract class CreateUserUseCases extends StateNotifier<CreateUserState> {
  CreateUserUseCases(CreateUserState state) : super(state);

  Future<void> createUser(
      {required String name, required String gender, required String email});
}
