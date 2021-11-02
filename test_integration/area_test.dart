import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:stepper/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    "end-to-end test",
    () {
      testWidgets("Check existent widget and their behavior in area screen",
          (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        // Test drawer, open drawer
        final Finder openDrawerButton = find.byTooltip("openDrawerButton");
        await tester.tap(openDrawerButton);
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        // Test navigate to area screen
        expect(find.byIcon(Icons.article_outlined), findsOneWidget);
        await tester.tap(find.text("Area"));
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        // Test tab bar, switch title and color
        await tester.tap(find.text("Mindset"));
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        await tester.tap(find.text("Expertise"));
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        await tester.tap(find.text("Scope"));
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();
      });
    },
  );
}
