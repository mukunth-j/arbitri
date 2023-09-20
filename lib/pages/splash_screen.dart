import 'dart:async';
import 'package:arbitri/pages/welcome_screen.dart';
import 'package:arbitri/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      //MaterialPageRoute(builder: (context) => MyDrawer()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: cPrimaryBlue,
      child: Center(
        child: Image.asset('assets/images/arbitri.png'),
      ),
    ));
  }
}
