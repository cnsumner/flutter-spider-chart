import 'package:flutter/material.dart';
import 'package:spider_chart_examples/basic_chart.dart';

import 'chart_with_labels.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spider Chart Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              key: Key("button_basic_chart"),
              style: ElevatedButton.styleFrom(elevation: 10),
              child: Text("Basic Chart"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return BasicChart();
                }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              key: Key("button_chart_with_labels"),
              style: ElevatedButton.styleFrom(elevation: 10),
              child: Text("Chart with labels"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return ChartWithLabels();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
