import 'package:freezed_result/freezed_result.dart';
import 'package:userdatabase/features/users/domain/entities/list_of_users_entity.dart';

import '../../core/domain/api_failure.dart';

abstract class ListOfUsersRepositoryInterface {
  Future<Result<ListOfUsersEntity, ApiFailure>> get();
}
