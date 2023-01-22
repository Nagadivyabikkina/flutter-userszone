import 'package:dio/dio.dart' as dio;
import 'package:mockito/mockito.dart';
import 'package:userdatabase/features/core/infrastructure/common_app_response.dart';
import 'package:userdatabase/features/users/infrastructure/apis/list_of_users_api_interface.dart';
import 'package:userdatabase/features/users/infrastructure/models/list_of_users_response_dto.dart';

import '../../mocks/users_list_mock.dart';

class UsersApiMock extends Mock implements ListOfUsersApiInterface {
  Map<String, dynamic>? mockResponse;
  bool? error;

  UsersApiMock({
    this.mockResponse,
    this.error,
  });

  @override
  Future<CommonAppResponse<ListOfUsersResponseDto>> get() async {
    if (error ?? false) {
      throw ThrowDioError().throwError(messageError: "messageError");
    } else {
      ListOfUsersResponseDto response =
          ListOfUsersResponseDto.fromJson(mockResponse ?? mockUsersList);
      return CommonAppResponse(response: response);
    }
  }
}

class ThrowDioError {
  dio.DioError throwError({String? messageError}) {
    throw dio.DioError(
        requestOptions: dio.RequestOptions(path: ''),
        response: dio.Response(
            requestOptions: dio.RequestOptions(path: ''),
            data: messageError ?? "Invalid token."),
        error: messageError ?? "Invalid token.");
  }
}
