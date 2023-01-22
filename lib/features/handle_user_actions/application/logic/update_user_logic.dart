import 'package:freezed_result/freezed_result.dart';

import '../../../core/domain/api_failure.dart';
import '../../domain/entities/user_info_entity.dart';
import '../../domain/update_user_repository_interface.dart';
import '../state/update_user_state.dart';
import '../usercases/update_user_usecases.dart';

class UpdateUserLogic extends UpdateUserUseCases {
  UpdateUserLogic({
    required this.updateUserRepo,
  }) : super(const UpdateUserState.initial());

  final UpdateUserRepositoryInterface updateUserRepo;

  @override
  Future<void> updateUser({
    required String name,
    required String gender,
    required String email,
    required int userId,
  }) async {
    Map<String, String> body = {
      'name': name,
      'email': email,
      'gender': gender,
      'status': 'active',
    };
    final Result<UserInfoEntity, ApiFailure> response =
        await updateUserRepo.put(body, userId);

    response.when(success: (UserInfoEntity updateUserResponse) {
      state = const UpdateUserState.updateSuccess();
    }, failure: (ApiFailure error) {
      state = const UpdateUserState.error();
    });
  }
}
