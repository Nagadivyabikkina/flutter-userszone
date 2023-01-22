import '../../../../core/app_initializers.dart';
import '../../../core/infrastructure/api_client.dart';
import '../../../core/infrastructure/common_app_response.dart';
import '../models/user_request_dto.dart';
import '../models/user_response_dto.dart';
import 'update_user_api_interface.dart';

class RawUpdateUserApi extends UpdateUserApiInterface {
  @override
  Future<CommonAppResponse<UserResponseDto>> put(
      Map<String, dynamic> body, int userId) async {
    UsersRequestDto usersRequestDto = UsersRequestDto.fromJson(body);
    final UserResponseDto response =
        await getIt<ApiClient>().updateUser(usersRequestDto, userId);
    return CommonAppResponse(response: response);
  }
}
