import 'package:freezed_result/freezed_result.dart';

import '../../core/domain/api_failure.dart';
import 'entities/user_info_entity.dart';

abstract class CreateUserRepositoryInterface {
  Future<Result<UserInfoEntity, ApiFailure>> post(Map<String, dynamic> body);
}
