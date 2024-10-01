import 'dart:async';

import 'package:cleanarchi/src/features/ui/Widgets/bottom_nav_bar.dart';
import 'package:cleanarchi/src/features/ui/screens/moviescreen.dart';
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
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomNavBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/splashScreen.png', height: 120, width: 200,),
      );


  }
}