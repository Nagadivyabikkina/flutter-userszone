import 'package:userdatabase/features/handle_user_actions/infrastructure/apis/fetch_user_api_interface.dart';

import '../../../../core/app_initializers.dart';
import '../../../core/infrastructure/api_client.dart';
import '../../../core/infrastructure/common_app_response.dart';
import '../models/user_response_dto.dart';

class RawFetchUserApi extends FetchUserApiInterface {
  @override
  Future<CommonAppResponse<UserResponseDto>> get(int userId) async {
    final UserResponseDto response =
        await getIt<ApiClient>().getUserById(userId);
    return CommonAppResponse(response: response);
  }
}
