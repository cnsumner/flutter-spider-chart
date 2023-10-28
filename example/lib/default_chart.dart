import 'package:flutter/material.dart';
import 'package:spider_chart_updated/spider_chart_updated.dart';

class DefaultChart extends StatelessWidget {
  const DefaultChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Default Chart'),
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
          ),
        ),
      ),
    );
  }
}
