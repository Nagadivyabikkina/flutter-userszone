import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_state.freezed.dart';

@freezed
class UpdateUserState with _$UpdateUserState {
  const factory UpdateUserState.initial() = _Initial;
  const factory UpdateUserState.updateSuccess() = _UpdateSuccess;
  const factory UpdateUserState.error() = _Error;
}
