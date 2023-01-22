import 'package:freezed_result/src/result.dart';
import 'package:userdatabase/features/core/domain/api_failure.dart';
import 'package:userdatabase/features/core/infrastructure/common_app_response.dart';

import '../../../core/domain/error_handling.dart';
import '../../domain/create_user_repository_interface.dart';
import '../../domain/entities/user_info_entity.dart';
import '../../infrastructure/apis/create_user_api_interface.dart';
import '../../infrastructure/models/user_response_dto.dart';

class DefaultCreateUserRepository extends CreateUserRepositoryInterface {
  DefaultCreateUserRepository(this.api);

  final CreateUserApiInterface api;

  @override
  Future<Result<UserInfoEntity, ApiFailure>> post(
      Map<String, dynamic> body) async {
    try {
      final CommonAppResponse<UserResponseDto> userInfoResponse =
          await api.post(body);
      if (userInfoResponse.response?.data != null) {
        return Result.success(
            UserInfoEntity.fromDomain(userInfoResponse.response!.data!));
      }
      return const Result.failure(ApiFailure.network());
    } catch (e) {
      return Result.failure(
          ApiFailure.network(errorMessage: ErrorMessage.handleError(e)));
    }
  }
}
