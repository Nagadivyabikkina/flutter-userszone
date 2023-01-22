import '../../../core/infrastructure/common_app_response.dart';
import '../models/user_response_dto.dart';

abstract class FetchUserApiInterface {
  Future<CommonAppResponse<UserResponseDto>> get(int userId);
}
