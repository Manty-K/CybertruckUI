import 'dart:ui';

import '../decorations/decorations.dart';
import '../widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_screen.dart';
import '../widgets/dark_button.dart';
import '../widgets/neo_icon.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _carAnimation;

  late Animation _kilometerAnimation;

  int kilometersTravelled = 150;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _carAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _kilometerAnimation = IntTween(begin: 0, end: 239).animate(_controller);
  }

  Future<void> prefetchAssets() async {
    await precacheImage(Image.asset('assets/images/Car.png').image, context);
    await precacheImage(
        Image.asset('assets/gif/cybertruck_opaque.gif').image, context);
    _controller.forward();
  }

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
                  height: 10,
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
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    AnimatedBuilder(
                        animation: _kilometerAnimation,
                        builder: (context, w) {
                          return Text(
                            // '$kilometersTravelled',
                            '${_kilometerAnimation.value}',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: Color(0xfffdfdfd),
                              fontSize: 150,
                              //fontWeight: FontWeight.w200,
                            ),
                          );
                        }),
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
                              color: Color(0xfffdfdfd)),
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
                  painter: BlueButton(buttonRadius: 40.0),
                  iconColor: Colors.white,
                  size: 100,
                  iconSize: 10,
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
          FutureBuilder<void>(
              future: prefetchAssets(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox();
                } else {
                  return AnimatedBuilder(
                      animation: _carAnimation,
                      builder: (context, _) {
                        return Positioned(
                          top: 250,
                          left: (1 - _carAnimation.value) * 410,
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => MainScreen(),
                              //   ),
                              // );

                              final ro = PageRouteBuilder(
                                  transitionsBuilder: (a, b, c, child) {
                                    return FadeTransition(
                                      child: child,
                                      opacity: b,
                                    );
                                  },
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  pageBuilder: (a, b, c) {
                                    return MainScreen();
                                  });

                              Navigator.push(
                                context,
                                ro,
                              );
                            },
                            child: Image.asset(
                              'assets/images/Car.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        );
                      });
                }
              }),
        ],
      ),
    );
  }
}

//'assets/icons/settings.svg'
