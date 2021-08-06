import 'dart:ui';

import 'package:flutter/material.dart';

class BlueButton extends CustomPainter {
  final buttonRadius;

  BlueButton({this.buttonRadius = 30.0});
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final topLeft = Offset(center.dx - 7, center.dy - 7);

    final bottomRight = Offset(center.dx + 7, center.dy + 7);

    final bgBlur = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff11a8fd),
            Color(0xff0081c9),
          ]).createShader(Rect.fromCircle(center: center, radius: buttonRadius))
      ..style = PaintingStyle.fill;

    final smallButton = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff005ea3),
            Color(0xff11a8fd),
          ]).createShader(
          Rect.fromCircle(center: center, radius: buttonRadius * 0.9))
      ..style = PaintingStyle.fill;

    final smallButtonBlur = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff11a8fd),
            Color(0xff0081c9),
          ]).createShader(
          Rect.fromCircle(center: center, radius: buttonRadius - 2))
      ..style = PaintingStyle.fill
      ..imageFilter = ImageFilter.blur(
        sigmaX: 2,
        sigmaY: 2,
        tileMode: TileMode.decal,
      );

    final hightlight = Paint()
      ..color = Color(0xff485057)
      ..style = PaintingStyle.fill
      ..imageFilter = ImageFilter.blur(
        sigmaX: 20,
        sigmaY: 20,
        tileMode: TileMode.decal,
      );

    final shadow = Paint()
      ..color = Color(0xff1f2427)
      ..style = PaintingStyle.fill
      ..imageFilter = ImageFilter.blur(
        sigmaX: 20,
        sigmaY: 20,
        tileMode: TileMode.decal,
      );
    //canvas.drawCircle(center, 30, paint);
    canvas.drawCircle(topLeft, buttonRadius, hightlight);
    canvas.drawCircle(bottomRight, buttonRadius, shadow);
    canvas.drawCircle(center, buttonRadius, bgBlur);
    canvas.drawCircle(center, buttonRadius * 0.9, smallButtonBlur);
    canvas.drawCircle(center, buttonRadius * 0.9, smallButton);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DisabledButton extends CustomPainter {
  final buttonRadius;

  DisabledButton({this.buttonRadius = 30.0});
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final topLeft = Offset(center.dx - 7, center.dy - 7);

    final bottomRight = Offset(center.dx + 7, center.dy + 7);

    final bgBlur = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff1d2328),
            Color(0xff131314),
          ]).createShader(Rect.fromCircle(center: center, radius: buttonRadius))
      ..style = PaintingStyle.fill;

    final smallButton = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff2f353a),
            Color(0xff1c1f22),
          ]).createShader(
          Rect.fromCircle(center: center, radius: buttonRadius * 0.9))
      ..style = PaintingStyle.fill;

    final smallButtonBlur = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff2f353a),
            Color(0xff1c1f22),
          ]).createShader(
          Rect.fromCircle(center: center, radius: buttonRadius - 2))
      ..style = PaintingStyle.fill
      ..imageFilter = ImageFilter.blur(
        sigmaX: 2,
        sigmaY: 2,
        tileMode: TileMode.decal,
      );

    final hightlight = Paint()
      ..color = Color(0xff485057)
      ..style = PaintingStyle.fill
      ..imageFilter = ImageFilter.blur(
        sigmaX: 20,
        sigmaY: 20,
        tileMode: TileMode.decal,
      );

    final shadow = Paint()
      ..color = Color(0xff1f2427)
      ..style = PaintingStyle.fill
      ..imageFilter = ImageFilter.blur(
        sigmaX: 20,
        sigmaY: 20,
        tileMode: TileMode.decal,
      );
    //canvas.drawCircle(center, 30, paint);
    canvas.drawCircle(topLeft, buttonRadius, hightlight);
    canvas.drawCircle(bottomRight, buttonRadius, shadow);
    canvas.drawCircle(center, buttonRadius, bgBlur);
    canvas.drawCircle(center, buttonRadius * 0.9, smallButtonBlur);
    canvas.drawCircle(center, buttonRadius * 0.9, smallButton);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
