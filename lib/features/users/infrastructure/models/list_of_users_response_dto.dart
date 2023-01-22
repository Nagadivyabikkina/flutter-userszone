import 'package:json_annotation/json_annotation.dart';

part 'list_of_users_response_dto.g.dart';

@JsonSerializable()
class ListOfUsersResponseDto {
  ListOfUsersResponseDto({
    this.data,
    this.code,
    this.meta,
  });
  List<UsersResponseDto>? data;
  int? code;
  Map<String, dynamic>? meta;

  factory ListOfUsersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ListOfUsersResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ListOfUsersResponseDtoToJson(this);
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
