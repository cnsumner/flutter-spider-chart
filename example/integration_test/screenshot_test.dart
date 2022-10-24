import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:spider_chart_examples/main.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Take screenshots', () {
    testWidgets('screenshot basic chart', (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      final finder = find.byKey(const Key("button_basic_chart"));

      await tester.tap(finder);

      await tester.pumpAndSettle();

      await binding.convertFlutterSurfaceToImage();

      await tester.pumpAndSettle();

      await binding.takeScreenshot('basic_chart');
    });

    testWidgets('screenshot chart with labels', (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      final finder = find.byKey(const Key("button_chart_with_labels"), skipOffstage: false);

      await tester.tap(finder);

      await tester.pumpAndSettle();

      await binding.convertFlutterSurfaceToImage();

      await tester.pumpAndSettle();

      await binding.takeScreenshot('chart_with_labels');
    });
  });
}
