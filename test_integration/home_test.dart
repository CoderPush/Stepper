import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:stepper/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end test", () {
    testWidgets("Check existent widget and their behavior",
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Test drawer, open drawer
      final Finder openDrawerButton = find.byTooltip("openDrawerButton");
      await tester.tap(openDrawerButton);
      await tester.pumpAndSettle();

      // Test drawer, close drawer
      final Finder closeDrawerButton = find.byTooltip("closeDrawerButton");
      await tester.tap(closeDrawerButton);
      await tester.pumpAndSettle();

      // Test floating action button, navigate to create post screen
      expect(find.byIcon(Icons.add), findsOneWidget);
      final Finder createPostButton = find.byTooltip("createPostButton");
      await tester.tap(createPostButton);
      await tester.pumpAndSettle();
    });
  });
}
