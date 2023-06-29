import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/calculator/presentation/calculator_screen/view/calculator_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  testWidgets('Render all components of the screen', (tester) async {
    await tester.pumpWidget(GetMaterialApp(
      home: CalculatorScreen(),
    ));

    expect(find.byType(TextField), findsOneWidget,
        reason: 'It should be render exactly 1 TextField');

    expect(find.byType(SafeArea), findsOneWidget,
        reason: 'It should be render exactly 1 SafeArea');
  });

  /// Testing if the textfield is showing the number 1.
  group('add with button', () {
    testWidgets('Show result when add a number', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
        home: CalculatorScreen(),
      ));
      await tester.tap(find.byKey(const Key('1')));
      expect(find.widgetWithText(TextField, '1'), findsOneWidget);
    });
  });
  group('add directly', () {
    testWidgets('Show result when add a number', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
        home: CalculatorScreen(),
      ));

      await tester.enterText(find.byKey(const Key('main_text_field')), '3');
      expect(find.widgetWithText(TextField, '3'), findsOneWidget);
    });
  });

  //* Testing if the floating button is visible.
  group('varying the visibility of the floating button', () {
    testWidgets('Show floating button visibility', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
        home: CalculatorScreen(),
      ));
      await tester.ensureVisible(find.byKey(const Key('floating_button')));
    });
  });
}
