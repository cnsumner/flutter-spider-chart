import 'package:flutter/material.dart';

import 'chart_with_labels.dart';

class MyHomePage extends StatelessWidget {
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
            MaterialButton(
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
