import 'package:flutter/material.dart';
import 'package:spider_chart/spider_chart.dart';

class ChartWithColorSwatch extends StatelessWidget {
  const ChartWithColorSwatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart With Color Swatch'),
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
            colorSwatch: Colors.lightGreen,
          ),
        ),
      ),
    );
  }
}
