import 'dart:math';

import 'package:discord_clone/decorations/decorations.dart';
import 'package:discord_clone/external/utils.dart';
import 'package:discord_clone/widgets/blue_button.dart';
import 'package:discord_clone/widgets/custom_slider.dart';
import 'package:discord_clone/widgets/label_text.dart';
import 'package:discord_clone/widgets/neo_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ProgramMode { auto, dry, cool, program }

class ACSettingsScreen extends StatefulWidget {
  const ACSettingsScreen({Key? key}) : super(key: key);

  @override
  _ACSettingsScreenState createState() => _ACSettingsScreenState();
}

class _ACSettingsScreenState extends State<ACSettingsScreen> {
  ProgramMode _programMode = ProgramMode.auto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: backgroundGradient(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(height: 40),
                Container(
                  height: 4,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelText(
                          text: 'A/C is ON',
                        ),
                        SizedBox(height: 5),
                        DespText(
                          text: 'Currently 27°C',
                        ),
                        DespText(
                          text: 'Will change in 2min',
                        ),
                      ],
                    ),
                    Spacer(),
                    NeuIcon(
                      svgPath: 'assets/icons/turn-off.svg',
                      painter: BlueButton(buttonRadius: 40.0),
                      iconColor: Colors.white,
                      size: 100,
                      iconSize: 20,
                      onTap: () {},
                    )
                  ],
                ),
                Spacer(),
                LabelText(text: 'Fan speed'),
                SizedBox(height: 10),
                CustomSlider(
                  value: 0.7,
                ),
                SizedBox(
                  height: 50,
                ),
                LabelText(text: 'Mode'),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NeuIcon(
                      svgPath: 'assets/icons/auto.svg',
                      painter: _programMode == ProgramMode.auto
                          ? BlueButton(buttonRadius: 40.0)
                          : DisabledButton(buttonRadius: 40.0),
                      iconColor: Colors.white,
                      size: 95,
                      iconSize: 15,
                      onTap: () {
                        setState(() {
                          _programMode = ProgramMode.auto;
                        });
                      },
                    ),
                    NeuIcon(
                      svgPath: 'assets/icons/dry.svg',
                      painter: _programMode == ProgramMode.dry
                          ? BlueButton(buttonRadius: 40.0)
                          : DisabledButton(buttonRadius: 40.0),
                      iconColor: Colors.white,
                      size: 95,
                      iconSize: 18,
                      onTap: () {
                        setState(() {
                          _programMode = ProgramMode.dry;
                        });
                      },
                    ),
                    NeuIcon(
                      svgPath: 'assets/icons/cool.svg',
                      painter: _programMode == ProgramMode.cool
                          ? BlueButton(buttonRadius: 40.0)
                          : DisabledButton(buttonRadius: 40.0),
                      iconColor: Colors.white,
                      size: 95,
                      iconSize: 20,
                      onTap: () {
                        setState(() {
                          _programMode = ProgramMode.cool;
                        });
                      },
                    ),
                    NeuIcon(
                      svgPath: 'assets/icons/program.svg',
                      painter: _programMode == ProgramMode.program
                          ? BlueButton(buttonRadius: 40.0)
                          : DisabledButton(buttonRadius: 40.0),
                      iconColor: Colors.white,
                      size: 95,
                      iconSize: 20,
                      onTap: () {
                        setState(() {
                          _programMode = ProgramMode.program;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  double degreeToRadian(double degree) {
    return degree * pi / 180;
  }
}

class FanControlPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final center = Offset(centerX, centerY);

    final radius = min(centerX, centerY);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Sweep extends StatelessWidget {
  const Sweep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
                // startAngle: degreeToRadian(30),
                // endAngle: degreeToRadian(180),
                colors: [
                  Colors.blue,
                  Colors.white,
                ])),
      ),
    );
  }
}
