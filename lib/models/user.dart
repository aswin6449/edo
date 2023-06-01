import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class Userr
{
  late String uid;
  Userr({required this.uid});

}



class Username extends StatefulWidget with ChangeNotifier{
  Username({Key? key}) : super(key: key);


  String get uname => uname;
  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  var uname = "".obs;
  CollectionReference cref = FirebaseFirestore.instance.collection('userdata');

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr?>(context, listen: false);

    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        //Fetching data from the documentId specified of the student
        future: cref.doc(user?.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          //Error Handling conditions
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }
          //Data is output to the user
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            uname = data['name'];
            return Text(" ${data['name']}");
          }
          return Text("loading");
        },
      ),
    );
  }
}
