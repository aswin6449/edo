import 'package:edo/Pages/splash_screen.dart';
import 'package:edo/models/user.dart';
import 'package:edo/providers/auth.dart';
import 'package:edo/providers/calculations.dart';
import 'package:edo/services/managedata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDgUvU-LG-QQl34Ghd3GqyjTh_9xuA6OHE",
        authDomain: "edo-ed-app.firebaseapp.com",
        projectId: "edo-ed-app",
        storageBucket: "edo-ed-app.appspot.com",
        messagingSenderId: "547288684423",
        appId: "1:547288684423:web:cdcd2cc9c8e40366166522"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Providers are used to pass the data down to the widget tree
    // return StreamProvider<Userr?>.value(
    //     initialData: null,
    //     value: AuthService().user,
    //     child:  MaterialApp(
    //       theme: ThemeData(
    //         primarySwatch: Colors.indigo,
    //       ),
    //       debugShowCheckedModeBanner: false,
    //       home: SplashScreen(),
    //     ),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ManageData()),
        ChangeNotifierProvider.value(value: Calculations()),
        ChangeNotifierProvider.value(value: Username()),

      ],
      // Stream has a list of event
      // Future has only one event

      child: StreamProvider<Userr?>.value(
        initialData: null,
        value: AuthService().user,
        child:  GetMaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
