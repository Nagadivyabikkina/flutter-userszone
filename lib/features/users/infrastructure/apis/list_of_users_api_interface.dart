import '../../../core/infrastructure/common_app_response.dart';
import '../models/list_of_users_response_dto.dart';

abstract class ListOfUsersApiInterface {
  Future<CommonAppResponse<ListOfUsersResponseDto>> get();
}
