// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:userdatabase/features/users/domain/entities/user_entity.dart';

part 'list_of_users_state.freezed.dart';

@freezed
class ListOfUsersState with _$ListOfUsersState {
  const factory ListOfUsersState.initial() = _Initial;
  const factory ListOfUsersState.fetchedListOfUsers(
      {required List<UserEntity> response}) = _FetchedListOfUsers;
  const factory ListOfUsersState.error() = _Error;
}
