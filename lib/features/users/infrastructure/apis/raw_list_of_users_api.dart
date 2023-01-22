import 'package:userdatabase/features/core/infrastructure/common_app_response.dart';

import '../../../../core/app_initializers.dart';
import '../../../core/infrastructure/api_client.dart';
import '../models/list_of_users_response_dto.dart';
import 'list_of_users_api_interface.dart';

class RawListOfUsersApi extends ListOfUsersApiInterface {
  @override
  Future<CommonAppResponse<ListOfUsersResponseDto>> get() async {
    final ListOfUsersResponseDto response = await getIt<ApiClient>().getUsers();
    if (response.data != null) {
      return CommonAppResponse(response: response);
    }

    throw Exception();
  }
}
