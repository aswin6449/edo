import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class ManageData extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future fetchData(String collection) async {
    QuerySnapshot querySnapshot = await firebaseFirestore.collection(collection).get();
    print(querySnapshot.docs);
    return querySnapshot.docs;
  }

  Future submitqueryData(BuildContext context, dynamic data) async {
    final user = Provider.of<Userr?>(context, listen: false);
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('queries');
    return _collectionRef.doc(user?.uid).collection('posts').doc().set(data);
  }

  Future submitcommentsData(BuildContext context, dynamic data) async {
    final user = Provider.of<Userr?>(context, listen: false);
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('queries');
    return _collectionRef.doc(user?.uid).collection('comments').doc().set(data);
  }

  Future submitmessageData(BuildContext context, dynamic data) async {
    final user = Provider.of<Userr?>(context, listen: false);
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('chat');
    return _collectionRef.doc(user?.uid).collection('Flutter').doc().set(data);
  }

  Future submitUserData(BuildContext context, dynamic data) async {
    final user = Provider.of<Userr?>(context, listen: false);
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('userdata');
    return _collectionRef.doc(user?.uid).set(data);
  }

}
