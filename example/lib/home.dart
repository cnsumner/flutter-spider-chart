import 'package:flutter/material.dart';
import 'package:spider_chart_examples/chart_with_max_value.dart';
import 'package:spider_chart_examples/default_chart.dart';
import 'package:spider_chart_examples/chart_with_color_swatch.dart';
import 'package:spider_chart_examples/chart_with_custom_colors.dart';

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
              key: const Key("button_default_chart"),
              style: ElevatedButton.styleFrom(elevation: 10),
              child: const Text("Default Chart"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const DefaultChart();
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ChartWithLabels();
                }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              key: const Key("button_chart_with_max_value"),
              style: ElevatedButton.styleFrom(elevation: 10),
              child: const Text("Chart with max value"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ChartWithMax();
                }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              key: const Key("button_chart_with_custom_colors"),
              style: ElevatedButton.styleFrom(elevation: 10),
              child: const Text("Chart with custom colors"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ChartWithCustomColors();
                }));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              key: const Key("button_chart_with_color_swatch"),
              style: ElevatedButton.styleFrom(elevation: 10),
              child: const Text("Chart with color swatch"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ChartWithColorSwatch();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
