import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spider_chart_examples/chart_with_color_swatch.dart';
import 'package:spider_chart_examples/chart_with_custom_colors.dart';
import 'package:spider_chart_examples/chart_with_labels.dart';
import 'package:spider_chart_examples/chart_with_max_value.dart';
import 'package:spider_chart_examples/default_chart.dart';
import 'package:spider_chart_examples/home.dart';

void main() {
  testWidgets('Smoke test home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Home()));
  });

  testWidgets('Smoke test default chart', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: DefaultChart()));
  });

  testWidgets('Smoke test chart with labels', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChartWithLabels()));
  });

  testWidgets('Smoke test chart with max value', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChartWithMax()));
  });

  testWidgets('Smoke test chart with custom colors',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: SpiderChartWithIndicatorText()));
  });

  testWidgets('Smoke test chart with color swatch',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChartWithColorSwatch()));
  });
}
