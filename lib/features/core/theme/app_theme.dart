import 'app_color_scheme.dart';
import 'app_text_theme.dart';
import 'base_app_theme.dart';

class AppTheme extends BaseAppTheme {
  AppTheme()
      : super(
          light: BaseAppThemeData(
            colorScheme: AppColorScheme.light,
            textTheme: AppTextTheme.lightTheme,
          ),
          dark: BaseAppThemeData(
            colorScheme: AppColorScheme.dark,
            textTheme: AppTextTheme.darkTheme,
          ),
        );
}
