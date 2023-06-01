import 'dart:async';
import 'package:edo/Pages/welcome.dart';
import 'package:edo/Pages/wraps.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: const Wrapper(),
                type: PageTransitionType.leftToRightWithFade)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 230.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 400,
                child: Lottie.asset('animations/splash.json'),
              ),
              Text(
                'Edo',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo.shade900,
                    fontFamily: 'Proxima',
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
