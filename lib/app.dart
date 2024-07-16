import 'package:flutter/material.dart';
import 'package:grocery/screens/splash_screen.dart';
import 'package:grocery/styles/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: SplashScreen(),
    );
  }
}
