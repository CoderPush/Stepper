import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:stepper/main.dart' as app;

import 'package:stepper/common/texts.dart';
import 'package:stepper/common/consts.dart';

import 'package:stepper/presentation/create_post/views/area_dropdown.dart';
import 'package:stepper/presentation/home/views/horizontal_area_list.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    "Integration test in create post screen",
    () {
      testWidgets("Check existing widgets and their behavior",
          (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        // Test floating action button, navigate to create post screen
        expect(find.byIcon(Icons.add), findsOneWidget);
        final Finder finderCreatePostButton = find.byTooltip(createPostButton);
        await tester.tap(finderCreatePostButton);
        await tester.pumpAndSettle();

        // Test open drop down
        final Finder finderAreaDropDown = find.byType(AreaDropdown);
        await tester.tap(finderAreaDropDown);
        await tester.pumpAndSettle();

        // Test close drop down
        final Finder finderCreatePostScreen = find.byType(MaterialApp);
        await tester.tap(finderCreatePostScreen);
        await tester.pumpAndSettle();

        // Test write update
        await tester.tap(find.text(writeUpdate));
        await tester.pumpAndSettle();

        final Finder finderUpdateTextField = find.byType(TextFormField);
        await tester.enterText(finderUpdateTextField, writeUpdateText);
        await tester.pumpAndSettle();

        // Test post button
        await tester.tap(find.text(setGoal));
        await tester.pumpAndSettle();
        await tester.tap(find.text(writeUpdate));
        await tester.pumpAndSettle();

        final Finder finderPostButton = find.byKey(const Key(postButton));
        await tester.tap(finderPostButton);
        await tester.pumpAndSettle(const Duration(seconds: 3));

        // Test check looking for a new post
        final Finder finderRecentlyUpdatedCard = find.byType(HorizontalAreaList);
        await tester.tap(finderRecentlyUpdatedCard);
        await tester.pumpAndSettle();

        final Finder finderPostListScrollView = find.byType(SingleChildScrollView);
        await tester.drag(finderPostListScrollView, const Offset(0.0, -5000));
        await tester.pumpAndSettle();

        expect(
            find.byWidgetPredicate((widget) =>
                widget is RichText && widget.text.toPlainText() == writeUpdateText),
            findsOneWidget);
      });
    },
  );
}
