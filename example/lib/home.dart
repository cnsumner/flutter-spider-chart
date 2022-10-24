import 'package:flutter/material.dart';
import 'package:spider_chart_examples/basic_chart.dart';

import 'chart_with_labels.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spider Chart Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              key: const Key("button_basic_chart"),
              style: ElevatedButton.styleFrom(elevation: 10),
              child: const Text("Basic Chart"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const BasicChart();
                }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              key: const Key("button_chart_with_labels"),
              style: ElevatedButton.styleFrom(elevation: 10),
              child: const Text("Chart with labels"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const ChartWithLabels();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
