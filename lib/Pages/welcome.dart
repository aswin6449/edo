import 'package:edo/Pages/personal/create_acc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'professional/login.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontSize: 22,
            fontFamily: 'Proxima',
            color: Colors.indigo.shade900,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 280.0),
        child: Row(
          children: [
            Center(
                child: Container(
              width: 400,
              height: 400,
              padding: EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 10,
                child: Column(
                  children: [
                    Lottie.asset('animations/personal.json'),
                    const SizedBox(height: 10),
                    const Text(
                      'Personal Space',
                      style: TextStyle(
                        fontFamily: 'Proxima',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          primary: Colors.indigo.shade900),
                      onPressed: () {
                        Navigator.pushReplacement(context, PageTransition(
                            child: CreateAccount(),
                            type: PageTransitionType.leftToRight
                        ));
                      },
                      child: const Text('Get Started'),
                    )
                  ],
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 150.0),
              child: Center(
                  child: Container(
                width: 400,
                height: 400,
                padding: EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    children: [
                      Lottie.asset('animations/proff.json',height: 260),
                      const SizedBox(height: 10),
                      const Text(
                        'Professional Space',
                        style: TextStyle(
                          fontFamily: 'Proxima',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                            primary: Colors.indigo.shade900),
                        onPressed: () {
                          Navigator.pushReplacement(context, PageTransition(
                              child: LoginAdmin(),
                              type: PageTransitionType.leftToRight
                          ));
                        },
                        child: const Text('Get Started'),
                      )
                    ],
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
