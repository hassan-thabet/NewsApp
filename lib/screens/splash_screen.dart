import 'dart:async';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  static String id = 'SplashScreen';
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    });
    return Scaffold(
      body: Center(
        child: Text(
          'Cairo Daily News',
          style: TextStyle(
            fontSize: 40,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
