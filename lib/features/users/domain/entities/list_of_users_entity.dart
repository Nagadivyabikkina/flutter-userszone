import 'package:freezed_annotation/freezed_annotation.dart';

import '../../infrastructure/models/list_of_users_response_dto.dart';
import 'user_entity.dart';

part 'list_of_users_entity.freezed.dart';

@freezed
class ListOfUsersEntity with _$ListOfUsersEntity {
  const factory ListOfUsersEntity({required List<UserEntity> response}) =
      _ListOfUsersEntity;

  factory ListOfUsersEntity.fromDomain(
      List<UsersResponseDto>? usersListResponseDto) {
    return ListOfUsersEntity(
        response: usersListResponseDto == null
            ? []
            : usersListResponseDto
                .map((UsersResponseDto e) => UserEntity.fromDomain(e))
                .toList());
  }
}
