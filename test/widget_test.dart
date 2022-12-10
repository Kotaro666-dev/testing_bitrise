// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_bitrise/app.dart';

import 'package:testing_bitrise/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.widgetWithText(AppBar, 'Count'), findsOneWidget);
    expect(
        find.widgetWithText(
            Text, 'You have pushed the button this many times:'),
        findsOneWidget);

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    final addIcon = find.byIcon(Icons.add);
    await tester.tap(addIcon);
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    await tester.tap(addIcon);
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsNothing);
  });
}
