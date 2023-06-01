import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:edo/services/managedata.dart';

class Calculations with ChangeNotifier {

  addtoqueryData(BuildContext context, dynamic data) async {
    await Provider.of<ManageData>(context, listen: false)
        .submitqueryData(context, data);
    notifyListeners();
  }

  addtocommentsData(BuildContext context, dynamic data) async {
    await Provider.of<ManageData>(context, listen: false)
        .submitcommentsData(context, data);
    notifyListeners();
  }

  addtomessageData(BuildContext context, dynamic data) async {
    await Provider.of<ManageData>(context, listen: false)
        .submitmessageData(context, data);
    notifyListeners();
  }

  addtoUserData(BuildContext context, dynamic data) async {
    await Provider.of<ManageData>(context, listen: false)
        .submitUserData(context, data);
    notifyListeners();
  }

}
