import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userdatabase/router/router_generator.dart';

Widget buildMaterialWidget(
    {required Widget child,
    MediaQueryData? mediaQueryData,
    List<Override>? scopeOverrides}) {
  return ProviderScope(
      overrides: scopeOverrides ?? <Override>[],
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: MediaQuery(
          data: mediaQueryData ?? const MediaQueryData(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Card(child: child),
          ),
        ),
      ));
}
