import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:userdatabase/core/app_initializers.dart';
import 'package:userdatabase/features/users/data_access/data_access.dart';
import 'package:userdatabase/features/users/data_access/repositories/list_of_users_repository.dart';
import 'package:userdatabase/features/users/presentation/list_of_users_screen.dart';

import '../../../mock_material_widget.dart';
import '../infrastructure/users_api_mock.dart';

void main() {
  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await appInitializers();
  });

  testWidgets('load User Screen list', (WidgetTester tester) async {
    await tester.pumpWidget(buildMaterialWidget(scopeOverrides: [
      listOfUsersRepoProvider
          .overrideWithValue(ListOfUsersRepository(UsersApiMock())),
    ], child: const ProviderScope(child: ListOfUsersScreen())));
    expect(find.byKey(const Key('loadedList')), findsNothing);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('loadedList')), findsOneWidget);
    expect(find.text('Kyle Sandy'), findsOneWidget);
    expect(find.text('Kyle Asgaralli'), findsOneWidget);
    expect(find.text('Kyle paul'), findsOneWidget);
  });

  Future<AppLocalizations> getLocalizations(WidgetTester tester) async {
    late AppLocalizations result;
    await tester.pumpWidget(buildMaterialWidget(
        scopeOverrides: [
          listOfUsersRepoProvider.overrideWithValue(
              ListOfUsersRepository(UsersApiMock(error: true))),
        ],
        child: Builder(builder: (BuildContext context) {
          result = AppLocalizations.of(context)!;
          return const ProviderScope(child: ListOfUsersScreen());
        })));
    await tester.pumpAndSettle();
    return result;
  }

  testWidgets('load User Screen errored', (WidgetTester tester) async {
    await getLocalizations(tester).then((l) => l.textServerError);
  });

  testWidgets('tap on User tile', (WidgetTester tester) async {
    await tester.pumpWidget(buildMaterialWidget(scopeOverrides: [
      listOfUsersRepoProvider
          .overrideWithValue(ListOfUsersRepository(UsersApiMock())),
    ], child: const ProviderScope(child: ListOfUsersScreen())));
    await tester.pumpAndSettle();
    expect(find.text('Kyle Sandy'), findsOneWidget);
    await tester.tap(find.text('Kyle Sandy'));
    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsOneWidget);
  });
}
