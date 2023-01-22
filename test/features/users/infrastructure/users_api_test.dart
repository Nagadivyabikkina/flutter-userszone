import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:userdatabase/core/app_initializers.dart';
import 'package:userdatabase/features/core/infrastructure/api_client.dart';
import 'package:userdatabase/features/core/infrastructure/common_app_response.dart';
import 'package:userdatabase/features/users/infrastructure/infrastructure.dart';
import 'package:userdatabase/features/users/infrastructure/models/list_of_users_response_dto.dart';

import '../../../api_helper_mock.dart';

void main() {
  setUpAll(() {
    getIt.registerSingleton<ApiClient>(ApiHelperMock());
  });
  tearDownAll(() {
    getIt.registerSingleton<ApiClient>(ApiHelperMock());
  });
  test('list of users api - success', () async {
    final repoProvider = ProviderContainer().read(listOfUsersApiProvider);
    CommonAppResponse<ListOfUsersResponseDto> result = await repoProvider.get();
    expect(result.response?.data?.first.email, 'kyle.paul@gmail.com');
    expect(result.response?.data?.first.name, 'Kyle paul');
    expect(result.response?.data?.first.gender, 'male');
    expect(result.response?.data?.first.id, 57798);
    expect(result.response?.data?.first.status, 'active');
  });

  test('list of users api - fail', () async {
    final repoProvider = ProviderContainer().read(listOfUsersApiProvider);
    await getIt.reset();
    getIt.registerSingleton<ApiClient>(ApiHelperMock(error: true));
    expect(repoProvider.get(), throwsA(isA<Exception>()));
  });
}
