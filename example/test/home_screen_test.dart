import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spider_chart_examples/home.dart';

void main() {
  testWidgets('Smoke test home screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Home()));
  });
}
