import 'package:flutter/material.dart';
import 'package:spider_chart_examples/basic_chart.dart';

import 'chart_with_labels.dart';

class Home extends StatelessWidget {
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
            RaisedButton(
              elevation: 10,
              color: Colors.white,
              child: Text("Basic Chart"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BasicChart();
                }));
              },
            ),
            RaisedButton(
              elevation: 10,
              color: Colors.white,
              child: Text("Chart with labels"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
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
