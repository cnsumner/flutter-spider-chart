import 'package:flutter/material.dart';
import 'package:spider_chart_updated/spider_chart_updated.dart';

class ChartWithCustomColors extends StatelessWidget {
  const ChartWithCustomColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart With Custom Colors'),
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
            colors: const <Color>[
              Colors.red,
              Colors.green,
              Colors.blue,
              Colors.yellow,
              Colors.indigo,
            ],
          ),
        ),
      ),
    );
  }
}
