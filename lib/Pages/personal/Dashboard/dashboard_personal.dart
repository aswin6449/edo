import 'package:edo/Pages/personal/Dashboard/chat/channels.dart';
import 'package:edo/Pages/personal/Dashboard/chat/chat.dart';
import 'package:edo/Pages/personal/Dashboard/profile/profile.dart';
import 'package:edo/Pages/personal/Dashboard/threads.dart';
import 'package:edo/Pages/welcome.dart';
import 'package:edo/models/user.dart';
import 'package:edo/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:side_navigation/side_navigation.dart';

class Personal_Dashboard extends StatefulWidget {
  const Personal_Dashboard({Key? key}) : super(key: key);
  @override
  State<Personal_Dashboard> createState() => _Personal_DashboardState();
}

class _Personal_DashboardState extends State<Personal_Dashboard> {
  List<Widget> views =  [
    Threads(),
    Channels(),
  ProfilePage1(),

  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr?>(context, listen: false);
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
      body: Row(
        children: [
          SideNavigationBar(
            theme:  SideNavigationBarTheme(
              backgroundColor: Colors.indigo.shade800,
              // backgroundColor: Colors.white,
          itemTheme:  SideNavigationBarItemTheme(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          iconSize: 22,
          labelTextStyle: TextStyle(
              fontSize: 15,
              color: Colors.black
          )
      ),
      togglerTheme: SideNavigationBarTogglerTheme(
        expandIconColor: Colors.white,
        shrinkIconColor: Colors.white

      ),
      dividerTheme: SideNavigationBarDividerTheme(showHeaderDivider: true, showMainDivider: true, showFooterDivider: true,
        mainDividerColor: Colors.grey,

      ),
    ),
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.add_link_outlined,
                label: 'Threads',
              ),
              SideNavigationBarItem(
                icon: Icons.chat,
                label: 'Channels',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            toggler: SideBarToggler(
                expandIcon: Icons.keyboard_arrow_right,
                shrinkIcon: Icons.keyboard_arrow_left,
                onToggle: () {
                }),
          ),
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}
