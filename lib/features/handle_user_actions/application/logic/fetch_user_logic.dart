import 'package:freezed_result/src/result.dart';

import '../../../core/domain/api_failure.dart';
import '../../domain/entities/user_info_entity.dart';
import '../../domain/fetch_user_repository_interface.dart';
import '../state/fetch_user_state.dart';
import '../usercases/fetch_user_usecases.dart';

class FetchSingleUserLogic extends FetchUserUserCases {
  FetchSingleUserLogic({
    required this.fetchUserRepo,
  }) : super(const FetchUserState.initial());

  final FetchUserRepositoryInterface fetchUserRepo;

  @override
  Future<void> fetchUserById(int userId) async {
    final Result<UserInfoEntity, ApiFailure> response =
        await fetchUserRepo.getByUserId(userId);

    response.when(success: (UserInfoEntity userResponse) {
      state = FetchUserState.fetchSuccess(response: userResponse);
    }, failure: (ApiFailure error) {
      state = const FetchUserState.error();
    });
  }
}
