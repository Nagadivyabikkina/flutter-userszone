import 'package:freezed_result/src/result.dart';
import 'package:userdatabase/features/core/domain/api_failure.dart';
import 'package:userdatabase/features/core/infrastructure/common_app_response.dart';
import 'package:userdatabase/features/users/infrastructure/apis/list_of_users_api_interface.dart';

import '../../../core/domain/error_handling.dart';
import '../../domain/entities/list_of_users_entity.dart';
import '../../domain/list_of_users_repository_interface.dart';
import '../../infrastructure/models/list_of_users_response_dto.dart';

class ListOfUsersRepository extends ListOfUsersRepositoryInterface {
  ListOfUsersRepository(this.api);

  final ListOfUsersApiInterface api;

  @override
  Future<Result<ListOfUsersEntity, ApiFailure>> get() async {
    try {
      final CommonAppResponse<ListOfUsersResponseDto> response =
          await api.get();
      List<UsersResponseDto>? usersListResponse = response.response?.data;

      if (usersListResponse != null) {
        return Result.success(ListOfUsersEntity.fromDomain(usersListResponse));
      }
      return const Result.failure(ApiFailure.network());
    } catch (e) {
      return Result.failure(
          ApiFailure.network(errorMessage: ErrorMessage.handleError(e)));
    }
  }
}
