import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spider_chart_examples/basic_chart.dart';

void main() {
  testWidgets('Smoke test basic chart', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: BasicChart()));
  });
}
