import 'package:flutter/material.dart';
import 'package:spider_chart_updated/spider_chart_updated.dart';

class ChartWithLabels extends StatelessWidget {
  const ChartWithLabels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart With Labels'),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: SpiderChartUpdated(
            data: const [
              7,
              5,
              10,
              7,
              4,
            ],
            labels: const <String>[
              "label 1",
              "label 2",
              "label 3",
              "label 4",
              "label 5",
            ],
          ),
        ),
      ),
    );
  }
}
