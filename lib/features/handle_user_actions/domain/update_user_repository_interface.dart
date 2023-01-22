import 'package:freezed_result/freezed_result.dart';
import 'package:userdatabase/features/handle_user_actions/domain/entities/user_info_entity.dart';

import '../../core/domain/api_failure.dart';

abstract class UpdateUserRepositoryInterface {
  Future<Result<UserInfoEntity, ApiFailure>> put(
      Map<String, dynamic> body, int userId);
}
