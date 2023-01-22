import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:userdatabase/features/core/infrastructure/paths.dart';

import '../../handle_user_actions/infrastructure/models/user_request_dto.dart';
import '../../handle_user_actions/infrastructure/models/user_response_dto.dart';
import '../../users/infrastructure/models/list_of_users_response_dto.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: baseUrlPath)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @GET(usersListPath)
  Future<ListOfUsersResponseDto> getUsers({
    @Query('name') String? authIndexType = 'kyle',
  });

  @POST(usersListPath)
  Future<UserResponseDto> createUser(@Body() UsersRequestDto body);

  @PUT(updateUserPath)
  Future<UserResponseDto> updateUser(
      @Body() UsersRequestDto body, @Path("id") int userId);

  @GET(updateUserPath)
  Future<UserResponseDto> getUserById(@Path("id") int userId);
}
