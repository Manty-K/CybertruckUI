import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NeuIcon extends StatelessWidget {
  final String svgPath;

  final CustomPainter painter;

  final Color iconColor;

  final double size;

  final double iconSize;
  final Function() onTap;

  NeuIcon({
    required this.svgPath,
    required this.painter,
    required this.iconColor,
    required this.size,
    required this.iconSize,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: size,
            width: size,
            child: CustomPaint(
              painter: painter,
            ),
          ),
          SvgPicture.asset(
            svgPath,
            height: iconSize,
            width: iconSize,
            color: iconColor,
          ),
        ],
      ),
    );
  }
}
