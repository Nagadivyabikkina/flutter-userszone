import 'package:userdatabase/features/handle_user_actions/infrastructure/models/user_request_dto.dart';
import 'package:userdatabase/features/handle_user_actions/infrastructure/models/user_response_dto.dart';

import '../../../../core/app_initializers.dart';
import '../../../core/infrastructure/api_client.dart';
import '../../../core/infrastructure/common_app_response.dart';
import 'create_user_api_interface.dart';

class RawCreateUserApi extends CreateUserApiInterface {
  @override
  Future<CommonAppResponse<UserResponseDto>> post(
      Map<String, dynamic> body) async {
    UsersRequestDto usersRequestDto = UsersRequestDto.fromJson(body);
    final UserResponseDto response =
        await getIt<ApiClient>().createUser(usersRequestDto);
    return CommonAppResponse(response: response);
  }
}
