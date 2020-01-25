import 'package:flutter_driver/flutter_driver.dart';
import 'package:screenshots/screenshots.dart';
import 'package:test/test.dart';

void main() {
  group('Take screenshots', () {
    final buttonFinderBack = find.byTooltip("Back");
    final buttonFinderBasicChart = find.byValueKey("button_basic_chart");
    final buttonFinderLabelsChart = find.byValueKey("button_chart_with_labels");

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDown(() async {
      await driver.waitFor(buttonFinderBack);
      await driver.tap(buttonFinderBack);
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('screenshot basic chart', () async {
      final config = Config();
      await driver.tap(buttonFinderBasicChart);

      await screenshot(driver, config, 'basic_chart');
    });

    test('screenshot chart with labels', () async {
      final config = Config();
      await driver.tap(buttonFinderLabelsChart);

      await screenshot(driver, config, 'chart_with_labels');
    });
  });
}
