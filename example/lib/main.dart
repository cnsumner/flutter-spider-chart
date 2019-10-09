import 'package:flutter/material.dart';
import 'package:spider_chart/spider_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spider Chart Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spider Chart Example'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
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
