import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edo/Pages/professional/dashboard/thread/new_thread.dart';
import 'package:edo/models/user.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProThreads extends StatefulWidget {
  const ProThreads({Key? key}) : super(key: key);

  @override
  State<ProThreads> createState() => _ProThreadsState();
}

class _ProThreadsState extends State<ProThreads> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr?>(context, listen: false);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: () {
            print("Clicked");
            Navigator.pushReplacement(context, PageTransition(
              child: Newthreadp(), type: PageTransitionType.leftToRightWithFade,
            ));
          },
          child: Icon(Icons.add,color: Colors.white,),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('queries')
              .doc(user?.uid)
              .collection('posts')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset('assets/animations/splash.json'),
              );
            } else {
              return ListView(
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot documentSnapshot) {
                    return GestureDetector(
                      onTap: (){
                        // Get.to(Threaddes());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white.withOpacity(0.8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.indigo,
                                    spreadRadius: 2)
                              ]),
                          height: 80,
                          // height: MediaQuery.of(context).size.height,
                          width: 400,
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Icon(Icons.person,size: 22,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text('Aswin B',style: TextStyle(
                                          fontFamily: 'Proxima',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      documentSnapshot['query'],
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList());
            }
          },
        )
    );
  }
}
