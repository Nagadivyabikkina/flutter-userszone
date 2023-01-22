import 'package:flutter/material.dart';
import 'package:userdatabase/features/core/theme/color_scheme.dart';

import '../../../core/app_initializers.dart';
import '../theme/base_app_theme.dart';
import '../theme/text_theme.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            '^[0-9A-Z_a-z][-0-9A-Z_a-z]*(\\.[-0-9A-Z_a-z]+)*@([0-9A-Z_a-z][-0-9A-Z_a-z]*(\\.[-0-9A-Z_a-z]+)*\\.(AERO|ARPA|BIZ|COM|COOP|EDU|GOV|INFO|INT|LAW|MIL|MOBI|MUSEUM|NAME|NET|ORG|PRO|TRAVEL|aero|arpa|biz|com|coop|edu|gov|info|int|law|mil|mobi|museum|name|net|org|pro|travel|[A-Za-z][A-Za-z])|([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}))(:[0-9]{1,5})?\$')
        .hasMatch(this);
  }
}

extension ThemeExts on BuildContext {
  bool get isDark {
    return MediaQuery.of(this).platformBrightness == Brightness.dark;
  }

  ColorSchemeData get color {
    if (isDark) {
      return getIt<BaseAppTheme>().dark.colorScheme;
    } else {
      return getIt<BaseAppTheme>().light.colorScheme;
    }
  }

  TextThemeData get style {
    if (isDark) {
      return getIt<BaseAppTheme>().dark.textTheme;
    } else {
      return getIt<BaseAppTheme>().light.textTheme;
    }
  }
}
