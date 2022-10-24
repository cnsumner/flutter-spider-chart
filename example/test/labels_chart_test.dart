import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spider_chart_examples/chart_with_labels.dart';

void main() {
  testWidgets('Smoke test basic chart', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChartWithLabels()));
  });
}
