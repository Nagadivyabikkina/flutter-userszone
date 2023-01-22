// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersRequestDto _$UsersRequestDtoFromJson(Map<String, dynamic> json) =>
    UsersRequestDto(
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UsersRequestDtoToJson(UsersRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'email': instance.email,
      'status': instance.status,
    };
