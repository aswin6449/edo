import 'package:edo/Pages/personal/Dashboard/dashboard_personal.dart';
import 'package:edo/Pages/professional/dashboard/dashboard_professional.dart';
import 'package:edo/Pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr?>(context);
    if(user==null)
      {
        return WelcomePage();
        // return Personal_Dashboard();
      }
    else
      {
        // return Personal_Dashboard();
        return Pro_Dashboard();
      }


  }
}

