import 'package:arbitri/pages/login_screen.dart';
import 'package:arbitri/pages/splash_screen.dart';
import 'package:arbitri/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
//import 'package:arbitri/pages/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: WelcomeScreen(),
      home: SafeArea(child: SplashScreen()),
      routes: {
        // Navigator.of(context).pushNamed('/welcome_screen'),
        //  Navigator.of(context).pushNamed('/login_screen'),
    '/welcome_screen': (context) => const WelcomeScreen(),
    '/login_screen': (context) => const LoginScreen(),
  },
    );
  }
}
