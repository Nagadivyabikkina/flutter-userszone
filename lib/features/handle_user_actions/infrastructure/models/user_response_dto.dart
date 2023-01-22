import 'package:json_annotation/json_annotation.dart';

part 'user_response_dto.g.dart';

@JsonSerializable()
class UserResponseDto {
  UserResponseDto({this.data, this.code, this.meta});
  UsersResponseDto? data;
  int? code;
  String? meta;

  factory UserResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseDtoToJson(this);
}

@JsonSerializable()
class UsersResponseDto {
  UsersResponseDto({
    required this.id,
    this.email = '',
    this.name = '',
    this.gender = '',
    this.status = '',
  });
  int id;
  String email;
  String name;
  String gender;
  String status;

  factory UsersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseDtoToJson(this);
}
