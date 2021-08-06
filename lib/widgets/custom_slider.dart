import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSlider extends StatefulWidget {
  final value;

  CustomSlider({required this.value});

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _xValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        print('${details.localPosition}');
        setState(() {
          _xValue = details.localPosition.dx;
        });
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          _xValue = details.localPosition.dx;
        });
      },
      child: Column(
        children: [
          buildNumbers(),
          Container(
            height: 30,
            // color: Colors.blue,
            width: double.maxFinite,
            child: CustomPaint(
              painter: _CustomSliderPainter(tapX: _xValue),
            ),
          ),
        ],
      ),
    );
  }

  buildNumbers() {
    List<Widget> numbers = [];
    for (int i = 1; i <= 5; i++) {
      numbers.add(Text(
        i.toString(),
        style: GoogleFonts.lato(
          color: Color(0xff7f8489),
        ),
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: numbers,
    );
  }
}

class _CustomSliderPainter extends CustomPainter {
  final double tapX;
  _CustomSliderPainter({required this.tapX});
  @override
  void paint(Canvas canvas, Size size) {
    double percentage = tapX / size.width;
    if (percentage <= 0.0) {
      percentage = 0.0;
    }
    if (percentage >= 1.0) {
      percentage = 1;
    }
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);

    final sliderHeight = 8.0;

    final thumbRadius = 15.0;

    final circleOffest = Offset(size.width * percentage, centerY);

    final rect = Rect.fromCenter(
        center: center, width: size.width, height: sliderHeight);

    final activeRect = Rect.fromLTWH(
        0, centerY - (sliderHeight / 2), size.width * percentage, sliderHeight);
    final radius = Radius.circular(sliderHeight);

    //inactive paint
    final inactiveTrackPaint = Paint()
      // ..color = Colors.amber
      ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff000000),
            Color(0xff4e5154),
          ]).createShader(activeRect);

    /// active paint
    final activeTrackPaint = Paint()
      ..color = Colors.green
      ..shader = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xff016bb8),
            Color(0xff0782db),
            Color(0xff0f9ceb),
            Color(0xff11a8fd),
          ]).createShader(activeRect);

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
          Rect.fromCircle(center: circleOffest, radius: thumbRadius * 0.9));

    final dotPaint = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff0f9bee),
            Color(0xff0172be),
          ]).createShader(Rect.fromCircle(center: circleOffest, radius: 2));

    ///inactive track
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), inactiveTrackPaint);

    /// active track
    canvas.drawRRect(
        RRect.fromRectAndRadius(activeRect, Radius.circular(sliderHeight)),
        activeTrackPaint);

    canvas.drawCircle(circleOffest, thumbRadius, bgBlur);
    canvas.drawCircle(circleOffest, thumbRadius * 0.9, smallButton);
    canvas.drawCircle(circleOffest, 2, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
