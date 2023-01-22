import 'package:freezed_result/src/result.dart';
import 'package:userdatabase/features/core/domain/api_failure.dart';

import '../../domain/entities/list_of_users_entity.dart';
import '../../domain/list_of_users_repository_interface.dart';
import '../state/list_of_users_state.dart';
import '../usecases/list_of_users_usecases.dart';

class ListOfUsersLogic extends ListOfUsersUseCases {
  ListOfUsersLogic({
    required this.usersRepo,
  }) : super(const ListOfUsersState.initial());

  final ListOfUsersRepositoryInterface usersRepo;

  @override
  Future<void> getUsersList() async {
    final Result<ListOfUsersEntity, ApiFailure> response =
        await usersRepo.get();

    response.when(success: (ListOfUsersEntity usersResponse) {
      state =
          ListOfUsersState.fetchedListOfUsers(response: usersResponse.response);
    }, failure: (ApiFailure error) {
      state = const ListOfUsersState.error();
    });
  }
}
