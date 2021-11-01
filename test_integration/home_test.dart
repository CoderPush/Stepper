import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:stepper/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end test", () {
    testWidgets("",
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
    });
  });
}
