import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:userdatabase/features/users/application/application.dart';
import 'package:userdatabase/features/users/application/state/list_of_users_state.dart';
import 'package:userdatabase/features/users/data_access/data_access.dart';
import 'package:userdatabase/features/users/data_access/repositories/list_of_users_repository.dart';
import 'package:userdatabase/features/users/domain/entities/user_entity.dart';
import 'package:userdatabase/features/users/infrastructure/apis/list_of_users_api_interface.dart';

import '../infrastructure/users_api_mock.dart';

void main() {
  Future<ProviderContainer> getMockAllServicesContainer({
    Map<String, dynamic>? mockResponse,
    bool? error,
  }) async {
    final usersApiProviderMock =
        Provider<ListOfUsersApiInterface>((ref) => UsersApiMock(error: error));

    final usersRepoProviderMock = Provider<ListOfUsersRepository>(
        (ref) => ListOfUsersRepository(ref.watch(usersApiProviderMock)));

    return ProviderContainer(
      overrides: [
        listOfUsersRepoProvider.overrideWithProvider(usersRepoProviderMock),
      ],
    );
  }

  test('fetch users list - success state', () async {
    final container = await getMockAllServicesContainer();
    final usersLogic = container.read(usersStateProvider.notifier);
    await usersLogic.getUsersList();
    List<UserEntity>? listOfUsersResponse = usersLogic.debugState.maybeMap(
        fetchedListOfUsers: (value) => value.response, orElse: () => null);
    expect(listOfUsersResponse != null, true);
    expect(listOfUsersResponse?.last.name, 'Kyle Sandy');
    expect(listOfUsersResponse?.last.gender, 'female');
    expect(usersLogic.debugState,
        ListOfUsersState.fetchedListOfUsers(response: listOfUsersResponse!));
  });

  test('fetch users Error - Failure state', () async {
    final container = await getMockAllServicesContainer(error: true);
    final usersLogic = container.read(usersStateProvider.notifier);
    await usersLogic.getUsersList();
    List<UserEntity>? listOfUsersResponse = usersLogic.debugState.maybeMap(
        fetchedListOfUsers: (value) => value.response, orElse: () => null);
    expect(listOfUsersResponse != null, false);
    expect(usersLogic.debugState, const ListOfUsersState.error());
  });
}
