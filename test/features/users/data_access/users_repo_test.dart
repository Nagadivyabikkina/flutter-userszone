import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_result/src/result.dart';
import 'package:userdatabase/features/core/domain/api_failure.dart';
import 'package:userdatabase/features/users/data_access/data_access.dart';
import 'package:userdatabase/features/users/data_access/repositories/list_of_users_repository.dart';
import 'package:userdatabase/features/users/domain/entities/list_of_users_entity.dart';

import '../infrastructure/users_api_mock.dart';

void main() {
  ProviderContainer getContainer({
    bool? error,
  }) {
    return ProviderContainer(
      overrides: [
        listOfUsersRepoProvider.overrideWithValue(
            ListOfUsersRepository(UsersApiMock(error: error))),
      ],
    );
  }

  test('fetches list of user - success', () async {
    final repoProvider = getContainer().read(listOfUsersRepoProvider);
    Result<ListOfUsersEntity, ApiFailure> response = await repoProvider.get();
    ListOfUsersEntity? data = response.maybeValue;
    expect(data != null, true);
    expect(data?.response.length, 3);
    expect(data?.response[0].email, 'kyle.paul@gmail.com');
    expect(data?.response[1].email, 'kyle.Asgaralli@gmail.com');
    expect(data?.response[2].email, 'kyleSandy@gmail.com');
    expect(data?.response[2].name, 'Kyle Sandy');
    expect(data?.response[2].gender, 'female');
    expect(data?.response[2].status, 'active');
    expect(data?.response[2].id, 57839);
  });

  test('fetches list of user - failure', () async {
    final repoProvider =
        getContainer(error: true).read(listOfUsersRepoProvider);
    Result<ListOfUsersEntity, ApiFailure> response = await repoProvider.get();
    ListOfUsersEntity? data = response.maybeValue;
    expect(data == null, true);
    expect(response.isFailure, true);
    expect(response.maybeError,
        const ApiFailure.network(errorMessage: 'messageError'));
  });
}
