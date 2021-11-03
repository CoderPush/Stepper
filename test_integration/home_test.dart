import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:stepper/main.dart' as app;

import 'package:stepper/presentation/home/views/horizontal_area_list.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end test", () {
    testWidgets("Check existing widgets and their behavior in home screen",
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

      // Test recently updated, navigate to post list screen
      final Finder createPostBackButton = find.byTooltip("createPostBackButton");
      await tester.tap(createPostBackButton);
      await tester.pumpAndSettle();

      final Finder recentlyUpdatedCard = find.byType(HorizontalAreaList);
      await tester.tap(recentlyUpdatedCard);
      await tester.pumpAndSettle();
    });
  });
}
