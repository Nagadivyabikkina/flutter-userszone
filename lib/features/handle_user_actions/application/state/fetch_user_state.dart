import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:userdatabase/features/handle_user_actions/domain/entities/user_info_entity.dart';

part 'fetch_user_state.freezed.dart';

@freezed
class FetchUserState with _$FetchUserState {
  const factory FetchUserState.initial() = _Initial;
  const factory FetchUserState.fetchSuccess(
      {required UserInfoEntity response}) = _FetchSuccess;
  const factory FetchUserState.error() = _Error;
}
