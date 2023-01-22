// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseDto _$UserResponseDtoFromJson(Map<String, dynamic> json) =>
    UserResponseDto(
      data: json['data'] == null
          ? null
          : UsersResponseDto.fromJson(json['data'] as Map<String, dynamic>),
      code: json['code'] as int?,
      meta: json['meta'] as String?,
    );

Map<String, dynamic> _$UserResponseDtoToJson(UserResponseDto instance) =>
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
