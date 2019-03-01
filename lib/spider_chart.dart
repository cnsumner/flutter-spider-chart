library spider_chart;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' show pi, cos, sin;

class SpiderChart extends StatelessWidget {
  final List<double> data;
  final double maxValue;
  final List<Color> colors;
  final decimalPrecision;
  final Size size;
  final double fallbackHeight;
  final double fallbackWidth;

  SpiderChart({
    Key key,
    @required this.data,
    @required this.colors,
    @required this.maxValue,
    this.size = Size.infinite,
    this.decimalPrecision = 0,
    this.fallbackHeight = 200,
    this.fallbackWidth = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: fallbackWidth,
      maxHeight: fallbackHeight,
      child: CustomPaint(
        size: size,
        painter: SpiderChartPainter(data, maxValue, colors, decimalPrecision),
      ),
    );
  }
}

class SpiderChartPainter extends CustomPainter {
  final List<double> data;
  final double maxNumber;
  final List<Color> colors;
  final decimalPrecision;

  final Paint spokes = Paint()..color = Colors.grey;

  final Paint fill = Paint()
    ..color = Color.fromARGB(15, 50, 50, 50)
    ..style = PaintingStyle.fill;

  final Paint stroke = Paint()
    ..color = Color.fromARGB(255, 50, 50, 50)
    ..style = PaintingStyle.stroke;

  SpiderChartPainter(
      this.data, this.maxNumber, this.colors, this.decimalPrecision);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    double angle = (2 * pi) / data.length;

    var points = List<Offset>();

    for (var i = 0; i < data.length; i++) {
      var scaledRadius = (data[i] / maxNumber) * center.dy;
      var x = scaledRadius * cos(angle * i - pi / 2);
      var y = scaledRadius * sin(angle * i - pi / 2);

      points.add(Offset(x, y) + center);
    }

    paintGraphOutline(canvas, center, angle);
    paintDataLines(canvas, points);
    paintDataPoints(canvas, points);
    paintText(canvas, center, points, data);
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
          TextSpan(text: s, style: TextStyle(color: Colors.black));
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

  void paintGraphOutline(Canvas canvas, Offset center, double angle) {
    var outline = List<Offset>();

    for (var i = 0; i < data.length; i++) {
      var x = center.dy * cos(angle * i - pi / 2);
      var y = center.dy * sin(angle * i - pi / 2);

      outline.add(Offset(x, y) + center);
      canvas.drawLine(center, outline[i], spokes);
    }

    outline.add(outline[0]);

    canvas.drawPoints(PointMode.polygon, outline, spokes);

    canvas.drawCircle(center, 2, spokes);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
