import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:stepper/main.dart' as app;

import 'package:stepper/presentation/create_post/views/area_dropdown.dart';
import 'package:stepper/presentation/create_post/views/area_slider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    "end-to-end test",
    () {
      testWidgets("Check existent widget and their behavior in create post screen",
          (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        // Test floating action button, navigate to create post screen
        expect(find.byIcon(Icons.add), findsOneWidget);
        final Finder createPostButton = find.byTooltip("createPostButton");
        await tester.tap(createPostButton);
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

        // Test drop down
        final Finder areaDropDown = find.byType(AreaDropdown);
        await tester.tap(areaDropDown);
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        // Test slider
        final Finder areaSlider = find.byType(AreaSlider);
        await tester.drag(areaSlider, const Offset(0, 3));
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        // Test switch write and set goal
        await tester.tap(find.text("Write update"));
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        await tester.tap(find.text("Set goal"));
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        // Test write update
        await tester.tap(find.text("Write update"));
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        const String writeUpdateText = "Today i will flutter code";
        final Finder updateTextField = find.byType(TextFormField);
        await tester.enterText(updateTextField, writeUpdateText);
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        // Test write set goal
        await tester.tap(find.text("Set goal"));
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();
      });
    },
  );
}
