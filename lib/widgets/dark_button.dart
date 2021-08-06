import 'dart:ui';

import 'package:flutter/material.dart';

class DarkButton extends CustomPainter {
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
            Color(0xff2c3036),
            Color(0xff31343c),
          ]).createShader(Rect.fromCircle(center: center, radius: 30))
      ..style = PaintingStyle.fill
      ..imageFilter = ImageFilter.blur(
        sigmaX: 2,
        sigmaY: 2,
        tileMode: TileMode.decal,
      );

    final smallButton = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff2f353a),
            Color(0xff1c1f22),
          ]).createShader(Rect.fromCircle(center: center, radius: 28))
      ..style = PaintingStyle.fill;

    final smallButtonBlur = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff2f353a),
            Color(0xff1c1f22),
          ]).createShader(Rect.fromCircle(center: center, radius: 28))
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
    canvas.drawCircle(topLeft, 30, hightlight);
    canvas.drawCircle(bottomRight, 30, shadow);
    canvas.drawCircle(center, 30, bgBlur);
    canvas.drawCircle(center, 28, smallButtonBlur);
    canvas.drawCircle(center, 28, smallButton);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
