import '../decorations/decorations.dart';
import 'ac_settings_screen.dart';
import '../widgets/information_bloc.dart';
import '../widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/dark_button.dart';
import '../widgets/neo_icon.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final batteryPercentage = 60;

  final temperature = 28;

  final kilometersTravelled = 297;

  final double a = 110;

  final double b = 650;

  late AnimationController _controller;
  late Animation _curve;

  final informationBlocs = [
    InformationBloc(
      primaryText: 'Engine',
      secondaryText: 'Sleeping Mode',
    ),
    InformationBloc(
      primaryText: 'Climate',
      secondaryText: 'A/C is ON',
      indicatorOn: true,
    ),
    InformationBloc(
      primaryText: 'Tires',
      secondaryText: 'Low Pressure',
      indicatorOn: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic);
  }

  void toggle() =>
      _controller.isDismissed ? _controller.forward() : _controller.reverse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _curve,
          builder: (context, _) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: backgroundGradient(),
                    //color: Color(0xff353a40),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            NeuIcon(
                              svgPath: 'assets/icons/menu.svg',
                              iconColor: Color(0xff7f8489),
                              painter: DarkButton(),
                              iconSize: 10,
                              size: 70,
                              onTap: () {},
                            ),
                            Spacer(),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    //todo delete
                                    toggle();
                                  },
                                  child: Text(
                                    'Tesla',
                                    style: GoogleFonts.lato(
                                      color: Color(0xff7F8489),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Cybertruck',
                                  style: GoogleFonts.lato(
                                    color: Color(0xfffdfdfd),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4,
                                        color: Color(0x80ffffff),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            NeuIcon(
                              svgPath: 'assets/icons/profile.svg',
                              iconColor: Color(0xff7f8489),
                              painter: DarkButton(),
                              iconSize: 16,
                              size: 70,
                              onTap: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        //CAR
                        Image.asset(
                          'assets/gif/cybertruck_opaque.gif',
                        ),

                        SizedBox(height: 10),
                        Container(
                          // color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelText(text: 'Status'),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  status(
                                    iconPath: 'assets/icons/battery.svg',
                                    statusName: 'Battery',
                                    statusValue: '$batteryPercentage%',
                                  ),
                                  SizedBox(width: 30),
                                  status(
                                    iconPath: 'assets/icons/range.svg',
                                    statusName: 'Range',
                                    statusValue: '$kilometersTravelled km',
                                  ),
                                  SizedBox(width: 30),
                                  status(
                                    iconPath: 'assets/icons/temperature.svg',
                                    statusName: 'Temperature',
                                    statusValue: '$temperature°C',
                                  )
                                ],
                              ),
                              SizedBox(height: 30),
                              LabelText(text: 'Information'),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  informationBlocs[0],
                                  informationBlocs[1],
                                ],
                              ),
                              SizedBox(height: 30),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  LabelText(text: 'Navigation'),
                                  Spacer(),
                                  Text(
                                    'History',
                                    style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    0,
                    ((1 - _curve.value) * 650) + 110,
                  ),
                  child: ACSettingsScreen(
                    handleClicked: () {
                      print('handle clicked');
                      toggle();
                    },
                  ),
                )
              ],
            );
          }),
    );
  }

  Widget status({
    required String iconPath,
    required String statusName,
    required String statusValue,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          iconPath,
          height: 16,
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              statusName,
              style: GoogleFonts.lato(
                color: Color(0xff7f8489),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              statusValue,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
