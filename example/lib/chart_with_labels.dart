import 'package:flutter/material.dart';
import 'package:spider_chart/spider_chart.dart';

class ChartWithLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart With Labels'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: SpiderChart(
              data: [
                7,
                5,
                10,
                7,
                4,
              ],
              maxValue: 10,
              colors: <Color>[
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.yellow,
                Colors.indigo,
              ],
              labels: <String>[
                "label 1",
                "label 2",
                "label 3",
                "label 4",
                "label 5",
              ]),
        ),
      ),
    );
  }
}
