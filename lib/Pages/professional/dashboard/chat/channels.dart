import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:edo/Pages/professional/dashboard/chat/chat.dart';
class Channelsp extends StatefulWidget {
  const Channelsp({Key? key}) : super(key: key);

  @override
  State<Channelsp> createState() => _ChannelspState();
}

class _ChannelspState extends State<Channelsp> {
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
                        Lottie.asset('animations/flutter.json',height: 260),
                        const SizedBox(height: 10),
                        const Text(
                          'Flutter - Mobile',
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
                        Get.to(ChatUip());
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
                          Lottie.asset('animations/web.json',height: 260),
                          const SizedBox(height: 10),
                          const Text(
                            'Web development',
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
                              Get.to(ChatUip());

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
                          Lottie.asset('animations/cyb.json',height: 260),
                          const SizedBox(height: 10),
                          const Text(
                            'Cyber Security',
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
                              Get.to(ChatUip());

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
