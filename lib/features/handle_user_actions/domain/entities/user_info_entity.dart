// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../infrastructure/models/user_response_dto.dart';

part 'user_info_entity.freezed.dart';

@freezed
class UserInfoEntity with _$UserInfoEntity {
  const factory UserInfoEntity({
    required int id,
    required String email,
    required String name,
    required String gender,
    required String status,
  }) = _UserInfoEntity;

  factory UserInfoEntity.fromDomain(UsersResponseDto userInfoDto) {
    return UserInfoEntity(
      name: userInfoDto.name,
      email: userInfoDto.email,
      gender: userInfoDto.gender,
      status: userInfoDto.status,
      id: userInfoDto.id,
    );
  }
}
