import 'package:flutter/material.dart';
import 'package:spider_chart/spider_chart.dart';

class BasicChart extends StatelessWidget {
  const BasicChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Chart'),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: SpiderChart(
            data: const [
              7,
              5,
              10,
              7,
              4,
            ],
            maxValue: 10,
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
