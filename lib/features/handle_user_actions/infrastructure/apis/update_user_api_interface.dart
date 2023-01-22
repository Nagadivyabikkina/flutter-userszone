import '../../../core/infrastructure/common_app_response.dart';
import '../models/user_response_dto.dart';

abstract class UpdateUserApiInterface {
  Future<CommonAppResponse<UserResponseDto>> put(
      Map<String, dynamic> body, int userId);
}
