import 'package:freezed_result/freezed_result.dart';
import 'package:userdatabase/features/handle_user_actions/infrastructure/apis/fetch_user_api_interface.dart';

import '../../../core/domain/api_failure.dart';
import '../../../core/domain/error_handling.dart';
import '../../../core/infrastructure/common_app_response.dart';
import '../../domain/entities/user_info_entity.dart';
import '../../domain/fetch_user_repository_interface.dart';
import '../../infrastructure/models/user_response_dto.dart';

class DefaultFetchUserRepository extends FetchUserRepositoryInterface {
  DefaultFetchUserRepository(this.api);

  final FetchUserApiInterface api;

  @override
  Future<Result<UserInfoEntity, ApiFailure>> getByUserId(int userId) async {
    try {
      final CommonAppResponse<UserResponseDto> response = await api.get(userId);
      if (response.response?.data != null) {
        UserInfoEntity createUserResponse =
            UserInfoEntity.fromDomain(response.response!.data!);
        return Result.success(createUserResponse);
      }
      return const Result.failure(ApiFailure.network());
    } catch (e) {
      return Result.failure(
          ApiFailure.network(errorMessage: ErrorMessage.handleError(e)));
    }
  }
}
