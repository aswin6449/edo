import 'package:edo/Pages/personal/Dashboard/dashboard_personal.dart';
import 'package:edo/Pages/welcome.dart';
import 'package:edo/providers/calculations.dart';
import 'package:flutter/material.dart';
import 'package:edo/providers/auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';


class Newthreadp extends StatefulWidget {
  const Newthreadp({Key? key}) : super(key: key);
  @override
  State<Newthreadp> createState() => _NewthreadpState();
}

class _NewthreadpState extends State<Newthreadp> {
  var query="";
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              _auth.signOut();
              Navigator.pushReplacement(context, PageTransition(
                  child: WelcomePage(),
                  type: PageTransitionType.leftToRightWithFade
              )
              );
            },
            icon: Icon(Icons.logout,color: Colors.indigo,),
          )
        ],
        title:Text(
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
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 500.0,right: 500),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text('Post your Query',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Proxima'
                ),),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value){
                    query = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Post your Question ...',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                    height: 40,
                    width: 80,
                    child: ElevatedButton(onPressed: (){
                      Provider.of<Calculations>(context, listen: false).addtoqueryData(context, {
                        'query': query,
                      });
                      Navigator.pushReplacement(context, PageTransition(
                          child: Personal_Dashboard(),
                          type: PageTransitionType.leftToRight)
                      );
                    }, child: Text('Post')))
              ],
            ),
          ),

        ],
      ),
    );
  }
}
