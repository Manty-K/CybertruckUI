import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelText extends StatelessWidget {
  const LabelText({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 25,
      ),
    );
  }
}

class DespText extends StatelessWidget {
  const DespText({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: Color(0xff7f8489),
        fontSize: 18,
      ),
    );
  }
}
