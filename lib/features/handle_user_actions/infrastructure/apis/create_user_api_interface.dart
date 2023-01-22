import '../../../core/infrastructure/common_app_response.dart';
import '../models/user_response_dto.dart';

abstract class CreateUserApiInterface {
  Future<CommonAppResponse<UserResponseDto>> post(Map<String, dynamic> body);
}
