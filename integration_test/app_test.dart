import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_tests/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
        'tap on the number 1 and verify if set the same number in the TextField',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Finds widget with the key 1.
      final Finder number1 = find.byKey(Key('1'));
      final Finder plus = find.byKey(Key('+'));
      final Finder number2 = find.byKey(Key('2'));
      final Finder equals = find.byKey(Key('='));

      // Emulate a tap on the button.
      await tester.tap(number1);
      await Future.delayed(Duration(seconds: 1));
      await tester.tap(plus);
      await Future.delayed(Duration(seconds: 1));
      await tester.tap(number2);
      await Future.delayed(Duration(seconds: 1));
      await tester.tap(equals);

      // Trigger a frame.
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 2));

      // Verify the TextField has the number 1.
      expect(find.widgetWithText(TextField, '1.0 + 2.0 = 3.0'), findsOneWidget);
    });
  });
}
