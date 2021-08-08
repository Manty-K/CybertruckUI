import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationBloc extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final bool indicatorOn;

  const InformationBloc(
      {required this.primaryText,
      required this.secondaryText,
      this.indicatorOn = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tapatap');
      },
      child: SizedBox(
        height: 170,
        width: 170,
        child: CustomPaint(
          willChange: true,
          isComplex: true,
          //size: Size(150, 150),
          painter: _InfonmationBlocPainter(indicatorOn: indicatorOn),
          child: Row(
            children: [
              SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  Text(
                    primaryText,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    secondaryText,
                    style: GoogleFonts.lato(
                      color: Color(0xff7f8489),
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfonmationBlocPainter extends CustomPainter {
  bool indicatorOn = false;
  _InfonmationBlocPainter({this.indicatorOn = false});

  double length = 150.0;

  double indicatorRadius = 2;

  double radius = 10.0;
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final indicatorPos = Offset(center.dx - 50, center.dy - 50);

    final shadowPos = Offset(center.dx + 10, center.dy + 10);

    final highlightPos = Offset(center.dx - 10, center.dy - 10);

    final indicatorInner = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff0172be),
            Color(0xff0f9bee),
          ]).createShader(Rect.fromCircle(
        center: indicatorPos,
        radius: indicatorRadius,
      ));

    final indicatorOuter = Paint()
      ..color = Color(0xff1b2125)
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(colors: [
        Color(0xff1b2125),
        Colors.black,
      ]).createShader(
        Rect.fromCircle(center: indicatorPos, radius: indicatorRadius * 4),
      );

    final indicatorGlow = Paint()
      ..color = Color(0xff0a8ddd)
      ..style = PaintingStyle.fill
      ..imageFilter = ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 10,
        tileMode: TileMode.decal,
      );

    final paint = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff1f232b),
            Color(0xff1a1c1f),
          ]).createShader(
        Rect.fromCenter(center: center, width: length, height: length),
      );

    final shadow = Paint()
      ..color = Color(0xff101012)
      ..style = PaintingStyle.fill
      ..imageFilter = ImageFilter.blur(
        sigmaX: 20,
        sigmaY: 20,
        tileMode: TileMode.decal,
      );

    final highlight = Paint()
      ..color = Color(0xff262e32)
      ..style = PaintingStyle.fill
      ..imageFilter = ImageFilter.blur(
        sigmaX: 20,
        sigmaY: 20,
        tileMode: TileMode.decal,
      );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromCenter(center: shadowPos, width: length, height: length),
          Radius.circular(radius)),
      shadow,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromCenter(center: highlightPos, width: length, height: length),
          Radius.circular(radius)),
      highlight,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromCenter(center: center, width: length, height: length),
          Radius.circular(radius)),
      paint,
    );

    if (indicatorOn) {
      canvas.drawCircle(indicatorPos, indicatorRadius * 2.0, indicatorOuter);

      canvas.drawCircle(indicatorPos, indicatorRadius, indicatorGlow);

      canvas.drawCircle(indicatorPos, indicatorRadius, indicatorInner);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
