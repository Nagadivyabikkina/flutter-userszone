import 'package:freezed_result/src/result.dart';

import '../../../core/domain/api_failure.dart';
import '../../domain/create_user_repository_interface.dart';
import '../../domain/entities/user_info_entity.dart';
import '../state/create_user_state.dart';
import '../usercases/create_user_usecases.dart';

class CreateUserLogic extends CreateUserUseCases {
  CreateUserLogic({
    required this.createUserRepo,
  }) : super(const CreateUserState.initial());

  final CreateUserRepositoryInterface createUserRepo;

  @override
  Future<void> createUser(
      {required String name,
      required String gender,
      required String email}) async {
    Map<String, String> body = {
      'name': name,
      'email': email,
      'gender': gender,
      'status': 'active',
    };
    final Result<UserInfoEntity, ApiFailure> response =
        await createUserRepo.post(body);

    response.when(success: (UserInfoEntity createUserResponse) {
      state = const CreateUserState.userCreated();
    }, failure: (ApiFailure error) {
      state = const CreateUserState.error();
    });
  }
}
