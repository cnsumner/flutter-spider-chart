/// A charting library for displaying spider/radar charts
library spider_chart;

import 'dart:math' show pi, cos, sin, max;
import 'dart:ui';

import 'package:flutter/material.dart';

/// Displays a spider/radar chart
class SpiderChart extends StatelessWidget {
  /// The data points to be displayed
  final List<double> data;

  /// The colors of the data points
  final List<Color> colors;
  final MaterialColor? colorSwatch;

  /// Optional labels for the data points
  final List<String> labels;

  /// The value represented by the chart perimeter
  final double? maxValue;
  final int decimalPrecision;

  /// Custom painter [Size]
  final Size size;
  final double fallbackHeight;
  final double fallbackWidth;
  final Color? lineColor;

  /// Creates a widget that displays a spider chart
  SpiderChart({
    Key? key,
    required this.data,
    this.colors = const [],
    this.maxValue,
    this.labels = const [],
    this.size = Size.infinite,
    this.decimalPrecision = 0,
    this.fallbackHeight = 200,
    this.fallbackWidth = 200,
    this.colorSwatch,
    this.lineColor,
  })  : assert(labels.isNotEmpty ? data.length == labels.length : true,
            'Length of data and labels lists must be equal'),
        assert(colors.isNotEmpty ? colors.length == data.length : true,
            "Custom colors length and data length must be equal"),
        assert(colorSwatch != null ? data.length < 10 : true,
            "For large data sets (>10 data points), please define custom colors using the [colors] parameter"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> dataPointColors;

    if (colors.isNotEmpty) {
      dataPointColors = colors;
    } else {
      var swatch = colorSwatch ?? Colors.blue;

      dataPointColors = <Color>[
        swatch.shade900,
        swatch.shade800,
        swatch.shade700,
        swatch.shade600,
        swatch.shade500,
        swatch.shade400,
        swatch.shade300,
        swatch.shade200,
        swatch.shade100,
        swatch.shade50,
      ].take(data.length).toList();
    }

    var calculatedMax = maxValue ?? data.reduce(max);

    return LimitedBox(
      maxWidth: fallbackWidth,
      maxHeight: fallbackHeight,
      child: CustomPaint(
        size: size,
        painter: SpiderChartPainter(data, calculatedMax, dataPointColors,
            labels, decimalPrecision, lineColor ?? Colors.grey),
      ),
    );
  }
}

/// Custom painter for the [SpiderChart] widget
class SpiderChartPainter extends CustomPainter {
  final List<double> data;
  final double maxNumber;
  final List<Color> colors;
  final List<String> labels;
  final int decimalPrecision;
  final Color? lineColor;

  final Paint spokes = Paint()..color = Colors.grey;

  final Paint fill = Paint()
    ..color = const Color.fromARGB(15, 50, 50, 50)
    ..style = PaintingStyle.fill;

  final Paint stroke = Paint()
    ..color = const Color.fromARGB(255, 50, 50, 50)
    ..style = PaintingStyle.stroke;

  SpiderChartPainter(this.data, this.maxNumber, this.colors, this.labels,
      this.decimalPrecision, this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    double angle = (2 * pi) / data.length;

    var dataPoints = <Offset>[];

    for (var i = 0; i < data.length; i++) {
      var scaledRadius = (data[i] / maxNumber) * center.dy;
      var x = scaledRadius * cos(angle * i - pi / 2);
      var y = scaledRadius * sin(angle * i - pi / 2);

      dataPoints.add(Offset(x, y) + center);
    }

    var outerPoints = <Offset>[];

    for (var i = 0; i < data.length; i++) {
      var x = center.dy * cos(angle * i - pi / 2);
      var y = center.dy * sin(angle * i - pi / 2);

      outerPoints.add(Offset(x, y) + center);
    }

    spokes.color = lineColor ?? Colors.grey;

    if (labels.isNotEmpty) {
      paintLabels(canvas, center, outerPoints, labels);
    }
    paintGraphOutline(canvas, center, outerPoints);
    paintDataLines(canvas, dataPoints);
    paintDataPoints(canvas, dataPoints);
    paintText(canvas, center, dataPoints, data);
  }

  void paintDataLines(Canvas canvas, List<Offset> points) {
    Path path = Path()..addPolygon(points, true);

    canvas.drawPath(
      path,
      fill,
    );

    canvas.drawPath(path, stroke);
  }

  void paintDataPoints(Canvas canvas, List<Offset> points) {
    for (var i = 0; i < points.length; i++) {
      canvas.drawCircle(points[i], 4.0, Paint()..color = colors[i]);
    }
  }

  void paintText(
      Canvas canvas, Offset center, List<Offset> points, List<double> data) {
    var textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (var i = 0; i < points.length; i++) {
      String s = data[i].toStringAsFixed(decimalPrecision);
      textPainter.text =
          TextSpan(text: s, style: const TextStyle(color: Colors.black));
      textPainter.layout();
      if (points[i].dx < center.dx) {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width + 5.0), 0));
      } else if (points[i].dx > center.dx) {
        textPainter.paint(canvas, points[i].translate(5.0, 0));
      } else if (points[i].dy < center.dy) {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width / 2), -20));
      } else {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width / 2), 4));
      }
    }
  }

  void paintGraphOutline(Canvas canvas, Offset center, List<Offset> points) {
    for (var i = 0; i < points.length; i++) {
      canvas.drawLine(center, points[i], spokes);
    }

    canvas.drawPoints(PointMode.polygon, [...points, points[0]], spokes);
    canvas.drawCircle(center, 2, spokes);
  }

  void paintLabels(
      Canvas canvas, Offset center, List<Offset> points, List<String> labels) {
    var textPainter = TextPainter(textDirection: TextDirection.ltr);
    var textStyle =
        TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold);

    for (var i = 0; i < points.length; i++) {
      textPainter.text = TextSpan(text: labels[i], style: textStyle);
      textPainter.layout();
      if (points[i].dx < center.dx) {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width + 5.0), -15));
      } else if (points[i].dx > center.dx) {
        textPainter.paint(canvas, points[i].translate(5.0, -15));
      } else if (points[i].dy < center.dy) {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width / 2), -35));
      } else {
        textPainter.paint(
            canvas, points[i].translate(-(textPainter.size.width / 2), 20));
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
