import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/list_of_users_state.dart';

abstract class ListOfUsersUseCases extends StateNotifier<ListOfUsersState> {
  ListOfUsersUseCases(ListOfUsersState state) : super(state);

  Future<void> getUsersList();
}
