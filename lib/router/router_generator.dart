import 'package:flutter/material.dart';
import 'package:userdatabase/features/core/widgets/base_scaffold.dart';
import 'package:userdatabase/features/handle_user_actions/presentation/edit_profile_screen.dart';
import 'package:userdatabase/features/users/presentation/list_of_users_screen.dart';

import '../features/handle_user_actions/presentation/create_user_screen.dart';
import '../features/handle_user_actions/presentation/view_user_screen.dart';

enum RouteFlow { auth, manageAccount, payment, mfa }

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _createRoute(const CreateUserScreen());
      case '/usersScreen':
        return _createRoute(const ListOfUsersScreen());
      case '/viewUserScreen':
        return _createRoute(
            ViewUserScreen(args: settings.arguments as ViewUserScreenArgs));
      case '/editUserScreen':
        return _createRoute(
            EditUserScreen(args: settings.arguments as EditUserScreenArgs));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _createRoute(Widget route) {
    return MaterialPageRoute(builder: (_) => route);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const BaseScaffold(
          appBarTitle: 'Error', body: Center(child: Text('ERROR OCCURRED')));
    });
  }
}
