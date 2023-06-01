import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edo/Pages/personal/Dashboard/dashboard_personal.dart';
import 'package:edo/Pages/welcome.dart';
import 'package:edo/models/user.dart';
import 'package:edo/providers/auth.dart';
import 'package:edo/providers/calculations.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Threaddes extends StatefulWidget {
  String query = "";
  Threaddes(this.query, {Key? key}) : super(key: key);
  @override
  State<Threaddes> createState() => _ThreaddesState();
}

class _ThreaddesState extends State<Threaddes> {
  var comments = "";
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final user = Provider.of<Userr?>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: WelcomePage(),
                      type: PageTransitionType.leftToRightWithFade));
            },
            icon: Icon(
              Icons.logout,
              color: Colors.indigo,
            ),
          )
        ],
        title: Text(
          'Edo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontSize: 22,
            fontFamily: 'Proxima',
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.indigo.shade900,
      ),
      body: Stack(
        children:[
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 33.0),
                child: Text(
                  widget.query,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'Proxima',
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2.0, right: 300),
                child: Text(
                  'Add Comments:',
                  style: TextStyle(
                    fontFamily: 'Proxima',
                    fontSize: 15,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 560.0, right: 550),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Add your comments",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo)),
                  ),
                  validator: (val) => val!.isEmpty ? 'Add your comments' : null,
                  onChanged: (val) {
                    setState(() => comments = val);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 90,
                height: 32,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      primary: Colors.indigo.shade900),
                  onPressed: () async {
                    Provider.of<Calculations>(context, listen: false)
                        .addtocommentsData(context, {
                      'comments': comments,
                    });
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: Personal_Dashboard(),
                            type: PageTransitionType.leftToRight));
                  },
                  child: Text('Submit'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2.0, right: 350),
                child: Text(
                  'Answers:',
                  style: TextStyle(
                    fontFamily: 'Proxima',
                    fontSize: 15,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('queries')
                      .doc(user?.uid)
                      .collection('comments')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    } else {
                      return ListView(
                          scrollDirection: Axis.vertical,
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot documentSnapshot) {
                            return Padding(
                              padding: const EdgeInsets.only(left:550.0,right:500),
                              child: Column(
                                children: [
                                  SizedBox(height: 15,),
                                  Container(
                                    width: 509,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: Colors.white.withOpacity(0.8),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.indigo,
                                              spreadRadius: 2)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          Text('User',style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            fontFamily: 'Proxima',
                                          ),),
                                          SizedBox(height: 5,),
                                          Text(
                                            documentSnapshot['comments'],
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList());
                    }
                  },
                ),
              ),

            ],
          ),




    ],
      ),
    );
  }
}
