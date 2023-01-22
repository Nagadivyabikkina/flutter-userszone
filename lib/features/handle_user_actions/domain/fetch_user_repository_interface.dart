import 'package:freezed_result/freezed_result.dart';

import '../../core/domain/api_failure.dart';
import 'entities/user_info_entity.dart';

abstract class FetchUserRepositoryInterface {
  Future<Result<UserInfoEntity, ApiFailure>> getByUserId(int userId);
}
