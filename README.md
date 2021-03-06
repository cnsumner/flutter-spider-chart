[![Pub](https://img.shields.io/pub/v/spider_chart.svg)](https://pub.dartlang.org/packages/spider_chart)
[![Gitlab pipeline status](https://img.shields.io/gitlab/pipeline/cnsumner/flutter-spider-chart.svg)](https://gitlab.com/cnsumner/flutter-spider-chart)

# spider_chart

A simple spider/radar chart library for Flutter.

![screenshot](screenshots/example_chart.png)

## Quick Start

More examples will be added, but this will get you going in the meantime. The chart can be sized with a container or by passing in a `Size` object to the `size` named parameter.

```dart
Center(
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
      maxValue: 10, // the maximum value that you want to represent (essentially sets the data scale of the chart)
      colors: <Color>[
        Colors.red,
        Colors.green,
        Colors.blue,
        Colors.yellow,
        Colors.indigo,
      ],
    ),
  ),
)
```
