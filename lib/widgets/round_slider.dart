import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundSlider extends StatefulWidget {
  final Function(double) onChanged;

  RoundSlider({required this.onChanged});

  @override
  _RoundSliderState createState() => _RoundSliderState();
}

class _RoundSliderState extends State<RoundSlider> {
  double _xValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        double x = details.localPosition.dx / 300;

        if (x <= 0) {
          x = 0;
        }

        if (x >= 1) {
          x = 1;
        }

        setState(() {
          _xValue = details.localPosition.dx;

          widget.onChanged(x);
        });
      },
      child: Container(
        height: 250,
        width: 250,
        // color: Colors.deepPurple,
        child: Transform.rotate(
          angle: 2.21,
          child: CustomPaint(
            painter: _RoundSliderPainter(
                localPos: _xValue,
                onChanged: (val) {
                  // widget.onChanged(val);
                }),
          ),
        ),
      ),
    );
  }
}

class _RoundSliderPainter extends CustomPainter {
  _RoundSliderPainter({required this.localPos, required this.onChanged});

  final double localPos;
  final Function(double) onChanged;
  // double percentage = 0.8;

  @override
  void paint(Canvas canvas, Size size) {
    double percentage = localPos / size.width;

    if (percentage <= 0) {
      percentage = 0;
    }

    if (percentage >= 1) {
      percentage = 1;
    }
    // onChanged(percentage);

    double maxAngle = 5;

    final double pathWidth = 30;

    final linesLength = 15;
    final linesSpacing = 10;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final center = Offset(centerX, centerY);

    double arcValue = percentage * maxAngle;

    final outerRadius = min(size.width - linesLength - linesSpacing,
            size.height - linesLength - linesSpacing) -
        pathWidth;

    final y = (outerRadius / 2) * sin(arcValue);
    final x = (outerRadius / 2) * cos(arcValue);

    final circleOffset = Offset(centerX + x, centerY + y);

    final circleRadius = pathWidth / 2;

    final arcPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = pathWidth
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        startAngle: 0,
        endAngle: maxAngle,
        colors: [
          Color(0xff005696),
          Color(0xff11a8fd),
          Color(0xff11a8fd),
          Color(0xff005696),
        ],
      ).createShader(Rect.fromCenter(
          center: center, width: outerRadius, height: outerRadius));

    final disabledArcPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = pathWidth
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(
        colors: [Colors.black, Color(0xff202428)],
      ).createShader(Rect.fromCenter(
          center: center, width: outerRadius, height: outerRadius));

    final bgBlur = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0xff282e2b);

    final smallButton = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff141515),
            Color(0xff2e3236),
          ]).createShader(
          Rect.fromCircle(center: circleOffset, radius: circleRadius * 0.9));

    final dotPaint = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff0f9bee),
            Color(0xff0172be),
          ]).createShader(Rect.fromCircle(center: circleOffset, radius: 2));

    final middleCirclePaint = Paint()
      ..color = Colors.amber
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff202428),
            Color(0xff131314),
          ]).createShader(
        Rect.fromCircle(center: center, radius: size.width / 2),
      );

    canvas.drawCircle(
        center, (outerRadius / 2) + (pathWidth / 2), middleCirclePaint);

    canvas.drawArc(
      Rect.fromCenter(center: center, width: outerRadius, height: outerRadius),
      0,
      5,
      false,
      disabledArcPaint,
    );
    canvas.drawArc(
        Rect.fromCenter(
            center: center, width: outerRadius, height: outerRadius),
        0,
        arcValue,
        false,
        arcPaint);

    // canvas.drawArc(Rect.fromCenter(center: center, width: 100, height: 100),
    //     arcValue, 0.000000001, false, circlePaint);

    // final y = (outerRadius / 2) * sin(arcValue);
    // final x = (outerRadius / 2) * cos(arcValue);

    // canvas.drawCircle(
    //     Offset(centerX + x, centerY + y), pathWidth / 2, circlePaint);

    canvas.drawCircle(circleOffset, circleRadius, bgBlur);
    canvas.drawCircle(circleOffset, circleRadius * 0.9, smallButton);
    canvas.drawCircle(circleOffset, 2, dotPaint);

    final linePaint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 3
      ..shader = SweepGradient(
        startAngle: 0,
        endAngle: maxAngle,
        colors: [
          Color(0xff005696),
          Color(0xff11a8fd),
          Color(0xff11a8fd),
          Color(0xff005696),
        ],
      ).createShader(Rect.fromCenter(
          center: center, width: outerRadius, height: outerRadius))
      ..strokeCap = StrokeCap.round;

    final linePaint2 = Paint()
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(
        radius: 0.8,
        //focalRadius: 0.9,
        // stops: [
        //   0.0,
        //   0.99,
        // ],
        colors: [
          Color(0xff15171c),
          Colors.black,
        ],
      ).createShader(Rect.fromCenter(
          center: center, width: size.width, height: size.height));

    for (int i = 0; i < 7; i++) {
      var radianSection = 5 / 6;

      var radianSectionOffset = radianSection * i;

      final ly =
          ((outerRadius / 2) + (pathWidth / 2) + (linesLength + linesSpacing)) *
              sin(radianSectionOffset);
      final lx =
          ((outerRadius / 2) + (pathWidth / 2) + (linesLength + linesSpacing)) *
              cos(radianSectionOffset);

      final lineOffsetEnd = Offset(centerX + lx, centerY + ly);

      final my = ((outerRadius / 2) + (pathWidth / 2) + (linesSpacing)) *
          sin(radianSectionOffset);
      final mx = ((outerRadius / 2) + (pathWidth / 2) + (linesSpacing)) *
          cos(radianSectionOffset);

      final lineOffsetStart = Offset(centerX + mx, centerY + my);

      if (radianSectionOffset <= arcValue) {
        canvas.drawLine(lineOffsetStart, lineOffsetEnd, linePaint);
      } else {
        canvas.drawLine(lineOffsetStart, lineOffsetEnd, linePaint2);
      }
    }

    // y = rsin(rad)
    //x = rcos(rad)
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

double degToRad(double deg) => deg * (pi / 180.0);
