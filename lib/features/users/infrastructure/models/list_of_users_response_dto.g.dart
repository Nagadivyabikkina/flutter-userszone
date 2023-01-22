// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_users_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfUsersResponseDto _$ListOfUsersResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ListOfUsersResponseDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UsersResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as int?,
      meta: json['meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ListOfUsersResponseDtoToJson(
        ListOfUsersResponseDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'code': instance.code,
      'meta': instance.meta,
    };

UsersResponseDto _$UsersResponseDtoFromJson(Map<String, dynamic> json) =>
    UsersResponseDto(
      id: json['id'] as int,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$UsersResponseDtoToJson(UsersResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'gender': instance.gender,
      'status': instance.status,
    };
