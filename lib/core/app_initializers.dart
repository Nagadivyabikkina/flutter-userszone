// Flutter imports:

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:userdatabase/features/core/infrastructure/api_client.dart';

import '../features/core/theme/app_theme.dart';
import '../features/core/theme/base_app_theme.dart';
import '../router/app_navigator_service.dart';

GetIt getIt = GetIt.asNewInstance();

Future<void> appInitializers() async {
  await getIt.reset();

  const String token =
      'b27480ee9335257a57fbed2fad11f53023482183ccdb77fa97e5db44cfaa8f5f';
  const String authorizationHeaderValue = 'Bearer $token';
  getIt.registerSingleton<AppNavigationService>(AppNavigationService());
  Dio dio = Dio(BaseOptions(contentType: "application/json"));
  dio.options.headers = {'Authorization': authorizationHeaderValue};
  getIt.registerSingleton<ApiClient>(ApiClient(dio));
  getIt.registerSingleton<BaseAppTheme>(AppTheme());

  await Future<void>.delayed(const Duration(milliseconds: 50));
}
