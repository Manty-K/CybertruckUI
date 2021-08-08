import 'dart:math';

import '../decorations/decorations.dart';
import '../external/utils.dart';
import '../widgets/blue_button.dart';
import '../widgets/custom_slider.dart';
import '../widgets/label_text.dart';
import '../widgets/neo_icon.dart';
import '../widgets/round_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ProgramMode { auto, dry, cool, program }

class ACSettingsScreen extends StatefulWidget {
  const ACSettingsScreen({required this.handleClicked});

  final Function() handleClicked;

  @override
  _ACSettingsScreenState createState() => _ACSettingsScreenState();
}

class _ACSettingsScreenState extends State<ACSettingsScreen> {
  ProgramMode _programMode = ProgramMode.auto;

  double acTemperature = 12.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: backgroundGradient(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              GestureDetector(
                  onTap: widget.handleClicked,
                  child: Container(
                    color: Colors.transparent,
                    height: 40,
                    width: double.maxFinite,
                  )),
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
                    onTap: () {
                      print('Ac Off');
                    },
                  )
                ],
              ),
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  RoundSlider(
                    onChanged: (val) {
                      final calculatedTemperature = val * 14 + 12;

                      setState(() {
                        acTemperature = calculatedTemperature;
                      });
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        '${acTemperature.round()}°C',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Cooling...',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
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
                    iconColor: _programMode == ProgramMode.auto
                        ? Colors.white
                        : Color(0xff7f8489),
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
                    iconColor: _programMode == ProgramMode.dry
                        ? Colors.white
                        : Color(0xff7f8489),
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
                    iconColor: _programMode == ProgramMode.cool
                        ? Colors.white
                        : Color(0xff7f8489),
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
                    iconColor: _programMode == ProgramMode.program
                        ? Colors.white
                        : Color(0xff7f8489),
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
    );
  }

  double degreeToRadian(double degree) {
    return degree * pi / 180;
  }
}

// class FanControlPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final centerX = size.width / 2;
//     final centerY = size.height / 2;

//     final center = Offset(centerX, centerY);

//     final radius = min(centerX, centerY);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// class Sweep extends StatelessWidget {
//   const Sweep({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Transform.rotate(
//       angle: -pi,
//       child: Container(
//         width: 300,
//         height: 300,
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: SweepGradient(
//                 // startAngle: degreeToRadian(30),
//                 // endAngle: degreeToRadian(180),
//                 colors: [
//                   Colors.blue,
//                   Colors.white,
//                 ])),
//       ),
//     );
//   }
// }
