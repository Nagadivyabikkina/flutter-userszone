import 'package:userdatabase/features/core/theme/text_theme.dart';

import 'color_scheme.dart';

class BaseAppTheme {
  BaseAppTheme({
    required this.light,
    required this.dark,
  });
  final BaseAppThemeData light;
  final BaseAppThemeData dark;
}

class BaseAppThemeData {
  BaseAppThemeData({
    required this.colorScheme,
    required this.textTheme,
  });
  ColorSchemeData colorScheme;
  TextThemeData textTheme;
}
