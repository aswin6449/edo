import 'package:edo/Pages/personal/Dashboard/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class Channels extends StatefulWidget {
  const Channels({Key? key}) : super(key: key);

  @override
  State<Channels> createState() => _ChannelsState();
}

class _ChannelsState extends State<Channels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0),
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
                        Lottie.asset('animations/books.json',height: 260),
                        const SizedBox(height: 10),
                        const Text(
                          'Books',
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
                        Get.to(ChatUi());
                          },
                          child: const Text('Get Started'),
                        )
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
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
                          Lottie.asset('animations/artist.json',height: 260),
                          const SizedBox(height: 10),
                          const Text(
                            'Arts',
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
                              Get.to(ChatUi());

                            },
                            child: const Text('Get Started'),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
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
                          Lottie.asset('animations/travel.json',height: 260),
                          const SizedBox(height: 10),
                          const Text(
                            'Travelling',
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
                              Get.to(ChatUi());

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
