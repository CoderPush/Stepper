import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:stepper/main.dart' as app;

import 'package:stepper/common/texts.dart';
import 'package:stepper/common/consts.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    "Integration test in area screen",
    () {
      testWidgets("Check existing widgets and their behavior",
          (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        // Test drawer, open drawer
        final Finder finderOpenDrawerButton = find.byTooltip(openDrawerButton);
        await tester.tap(finderOpenDrawerButton);
        await tester.pumpAndSettle();

        // Test navigate to area screen
        expect(find.byIcon(Icons.article_outlined), findsOneWidget);
        await tester.tap(find.text(area));
        await tester.pumpAndSettle();

        // Test tab bar, switch title and color
        await tester.tap(find.text(mindset));
        await tester.pumpAndSettle();

        await tester.tap(find.text(expertise));
        await tester.pumpAndSettle();

        await tester.tap(find.text(scope));
        await tester.pumpAndSettle();
      });
    },
  );
}
