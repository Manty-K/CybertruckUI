import 'package:flutter/material.dart';

Gradient backgroundGradient() {
  return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        0.5,
        1
      ],
      colors: [
        // Color(0xff353a40),
        Color(0xff33383e),
        Color(0xff16171b),
      ]);
}
