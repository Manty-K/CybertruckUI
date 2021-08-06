import 'dart:ui';
import 'package:discord_clone/screens/ac_settings_screen.dart';
import 'package:flutter/services.dart';

import 'package:discord_clone/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff16171b), // navigation bar color
        statusBarColor: Color(0xff353a40) // status bar color
        ));
    return MaterialApp(
        title: 'Tesla',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ACSettingsScreen());
  }
}
