import 'dart:ui';

import 'package:discord_clone/decorations/decorations.dart';
import 'package:discord_clone/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_screen.dart';
import '../widgets/dark_button.dart';
import '../widgets/neo_icon.dart';

class WelcomeScreen extends StatelessWidget {
  int kilometersTravelled = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: backgroundGradient()),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 5),
                Row(
                  children: [
                    Spacer(),
                    NeuIcon(
                      svgPath: 'assets/icons/settings.svg',
                      iconColor: Color(0xff7f8489),
                      painter: DarkButton(),
                      iconSize: 20,
                      size: 70,
                      onTap: () {},
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Tesla',
                  style: GoogleFonts.lato(
                    color: Color(0xff7F8489),
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Cybertruck',
                  style: GoogleFonts.lato(
                    color: Color(0xfffdfdfd),
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(
                      '$kilometersTravelled',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        color: Color(0xfffdfdfd),
                        fontSize: 200,
                        //fontWeight: FontWeight.w200,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'km',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 30,
                            color: Color(0xfffdfdfd),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                Spacer(),
                Text(
                  'A/C is turned on',
                  style: GoogleFonts.lato(
                    color: Color(0xff7f8489),
                    fontSize: 24,
                  ),
                ),
                NeuIcon(
                  svgPath: 'assets/icons/lock.svg',
                  painter: BlueButton(buttonRadius: 60.0),
                  iconColor: Colors.white,
                  size: 180,
                  iconSize: 30,
                  onTap: () {},
                ),
                Text(
                  'Tap to open the car',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
          Positioned(
            top: 350,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/Car.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          )
        ],
      ),
    );
  }
}

//'assets/icons/settings.svg'
