import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/fetch_user_state.dart';

abstract class FetchUserUserCases extends StateNotifier<FetchUserState> {
  FetchUserUserCases(FetchUserState state) : super(state);

  Future<void> fetchUserById(int userId);
}
