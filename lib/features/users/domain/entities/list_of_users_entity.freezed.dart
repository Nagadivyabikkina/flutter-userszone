// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_of_users_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListOfUsersEntity {
  List<UserEntity> get response => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListOfUsersEntityCopyWith<ListOfUsersEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListOfUsersEntityCopyWith<$Res> {
  factory $ListOfUsersEntityCopyWith(
          ListOfUsersEntity value, $Res Function(ListOfUsersEntity) then) =
      _$ListOfUsersEntityCopyWithImpl<$Res, ListOfUsersEntity>;
  @useResult
  $Res call({List<UserEntity> response});
}

/// @nodoc
class _$ListOfUsersEntityCopyWithImpl<$Res, $Val extends ListOfUsersEntity>
    implements $ListOfUsersEntityCopyWith<$Res> {
  _$ListOfUsersEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_value.copyWith(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListOfUsersEntityCopyWith<$Res>
    implements $ListOfUsersEntityCopyWith<$Res> {
  factory _$$_ListOfUsersEntityCopyWith(_$_ListOfUsersEntity value,
          $Res Function(_$_ListOfUsersEntity) then) =
      __$$_ListOfUsersEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserEntity> response});
}

/// @nodoc
class __$$_ListOfUsersEntityCopyWithImpl<$Res>
    extends _$ListOfUsersEntityCopyWithImpl<$Res, _$_ListOfUsersEntity>
    implements _$$_ListOfUsersEntityCopyWith<$Res> {
  __$$_ListOfUsersEntityCopyWithImpl(
      _$_ListOfUsersEntity _value, $Res Function(_$_ListOfUsersEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$_ListOfUsersEntity(
      response: null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
    ));
  }
}

/// @nodoc

class _$_ListOfUsersEntity implements _ListOfUsersEntity {
  const _$_ListOfUsersEntity({required final List<UserEntity> response})
      : _response = response;

  final List<UserEntity> _response;
  @override
  List<UserEntity> get response {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  String toString() {
    return 'ListOfUsersEntity(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListOfUsersEntity &&
            const DeepCollectionEquality().equals(other._response, _response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_response));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListOfUsersEntityCopyWith<_$_ListOfUsersEntity> get copyWith =>
      __$$_ListOfUsersEntityCopyWithImpl<_$_ListOfUsersEntity>(
          this, _$identity);
}

abstract class _ListOfUsersEntity implements ListOfUsersEntity {
  const factory _ListOfUsersEntity({required final List<UserEntity> response}) =
      _$_ListOfUsersEntity;

  @override
  List<UserEntity> get response;
  @override
  @JsonKey(ignore: true)
  _$$_ListOfUsersEntityCopyWith<_$_ListOfUsersEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
