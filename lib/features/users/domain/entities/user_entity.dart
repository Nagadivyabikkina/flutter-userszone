import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:userdatabase/features/users/infrastructure/models/list_of_users_response_dto.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String email,
    required String name,
    required String gender,
    required String status,
  }) = _UserEntity;

  factory UserEntity.fromDomain(UsersResponseDto usersResponseDto) {
    return UserEntity(
      id: usersResponseDto.id,
      email: usersResponseDto.email,
      name: usersResponseDto.name,
      gender: usersResponseDto.gender,
      status: usersResponseDto.status,
    );
  }
}
