import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:userdatabase/features/core/infrastructure/api_client.dart';
import 'package:userdatabase/features/core/infrastructure/paths.dart';
import 'package:userdatabase/features/users/infrastructure/models/list_of_users_response_dto.dart';

import 'features/mocks/users_list_mock.dart';

class ApiHelperMock extends Mock implements ApiClient {
  ApiHelperMock({this.error});
  bool? error;
  @override
  @GET(usersListPath)
  Future<ListOfUsersResponseDto> getUsers({
    @Query('name') String? authIndexType = 'kyle',
  }) async {
    if (error ?? false) {
      throw Exception();
    } else {
      return ListOfUsersResponseDto.fromJson(mockUsersList);
    }
  }
}
