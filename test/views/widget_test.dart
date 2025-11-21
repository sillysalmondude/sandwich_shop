// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sandwich_shop/main.dart';

void main() {
  testWidgets('Sandwich order quantity increments and decrements',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that our sandwich counter starts at 0.
    expect(find.textContaining('0 white footlong sandwich'), findsOneWidget);

    // Tap the 'Add' button and trigger a frame.
    await tester.tap(find.text('Add'));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.textContaining('1 white footlong sandwich'), findsOneWidget);

    // Tap the 'Remove' button and trigger a frame.
    await tester.tap(find.text('Remove'));
    await tester.pump();

    // Verify that our counter has decremented back to 0.
    expect(find.textContaining('0 white footlong sandwich'), findsOneWidget);
  });

  testWidgets('Switch toggles between six-inch and footlong',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that the sandwich type starts as 'footlong'.
    expect(find.textContaining('footlong sandwich'), findsOneWidget);
    expect(find.textContaining('six-inch sandwich'), findsNothing);

    // Tap the Switch widget to toggle it.
    await tester.tap(find.byKey(const Key('sandwich_size_switch')));
    await tester.pump();

    // Verify that the sandwich type changed to 'six-inch'.
    expect(find.textContaining('six-inch sandwich'), findsOneWidget);
    expect(find.textContaining('footlong sandwich'), findsNothing);

    // Tap the Switch widget again to toggle it back.
    await tester.tap(find.byKey(const Key('sandwich_size_switch')));
    await tester.pump();

    // Verify that the sandwich type changed back to 'footlong'.
    expect(find.textContaining('footlong sandwich'), findsOneWidget);
    expect(find.textContaining('six-inch sandwich'), findsNothing);
  });
}
