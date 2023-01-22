import 'package:json_annotation/json_annotation.dart';

part 'user_request_dto.g.dart';

@JsonSerializable()
class UsersRequestDto {
  UsersRequestDto({
    this.name,
    this.gender,
    this.email,
    this.status,
  });
  final String? name;
  final String? gender;
  final String? email;
  final String? status;

  factory UsersRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UsersRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsersRequestDtoToJson(this);
}
