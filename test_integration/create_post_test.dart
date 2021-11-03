import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:stepper/main.dart' as app;

import 'package:stepper/common/texts.dart';
import 'package:stepper/common/consts.dart';

import 'package:stepper/presentation/create_post/views/area_slider.dart';
import 'package:stepper/presentation/create_post/views/area_dropdown.dart';
import 'package:stepper/presentation/home/views/horizontal_area_list.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    "end-to-end test",
    () {
      testWidgets("Check existing widgets and their behavior in create post screen",
          (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();

        // Test floating action button, navigate to create post screen
        expect(find.byIcon(Icons.add), findsOneWidget);
        final Finder finderCreatePostButton = find.byTooltip(createPostButton);
        await tester.tap(finderCreatePostButton);
        await tester.pumpAndSettle();

        // Test tab bar, switch title and color
        await tester.tap(find.text(mindset));
        await tester.pumpAndSettle();

        await tester.tap(find.text(expertise));
        await tester.pumpAndSettle();

        await tester.tap(find.text(scope));
        await tester.pumpAndSettle();

        // Test open drop down
        final Finder finderAreaDropDown = find.byType(AreaDropdown);
        await tester.tap(finderAreaDropDown);
        await tester.pumpAndSettle();

        // Test close drop down
        final Finder finderCreatePostScreen = find.byType(MaterialApp);
        await tester.tap(finderCreatePostScreen);
        await tester.pumpAndSettle();

        // // Test slider
        final Finder finderAreaSlider = find.byType(AreaSlider);
        await tester.drag(finderAreaSlider, const Offset(237.2, 177.1));
        await tester.pumpAndSettle();

        // Test write update
        await tester.tap(find.text(writeUpdate));
        await tester.pumpAndSettle();

        final Finder finderUpdateTextField = find.byType(TextFormField);
        await tester.enterText(finderUpdateTextField, writeUpdateText);
        await tester.pumpAndSettle();

        // Test add set goal
        await tester.tap(find.text(setGoal));
        await tester.pumpAndSettle();

        final Finder finderAddGoalButton = find.byKey(const Key(addGoalButton));
        for (var index = 0; index < 3; index++) {
          await tester.tap(finderAddGoalButton);
          await tester.pumpAndSettle();
        }

        // Test close goal
        for (var index = 0; index < 2; index++) {
          final Finder finderCloseGoalButton = find.byType(IconButton).first;
          await tester.tap(finderCloseGoalButton);
          await tester.pumpAndSettle();
        }

        // Test post button
        await tester.tap(find.text(writeUpdate));
        await tester.pumpAndSettle();

        final Finder finderPostButton = find.byKey(const Key(postButton));
        await tester.tap(finderPostButton);
        await tester.pumpAndSettle();

        // Test check looking for a new post
        final Finder finderRecentlyUpdatedCard = find.byType(HorizontalAreaList);
        await tester.tap(finderRecentlyUpdatedCard);
        await tester.pumpAndSettle();

        final Finder finderPostListScrollView = find.byType(SingleChildScrollView);
        await tester.drag(finderPostListScrollView, const Offset(0.0, -300));
        await tester.pumpAndSettle();
      });
    },
  );
}
