import 'package:edo/Pages/personal/Dashboard/dashboard_personal.dart';
import 'package:edo/Pages/personal/login.dart';
import 'package:edo/providers/auth.dart';
import 'package:edo/providers/calculations.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String error = '';
  String password = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontSize: 22,
            fontFamily: 'Proxima',
            color: Colors.indigo.shade900,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(left: 500.0, right: 500),
              child: Center(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      'Create new Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Proxima',
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.indigo)),
                      ),
                      validator: (val) =>
                      val!.isEmpty ? 'Enter your name' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.indigo)),
                        ),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.indigo)),
                      ),
                      validator: (val) =>
                          val!.length < 6 ? 'Enter a valid password' : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.indigo)),
                      ),
                      validator: (val) =>
                      val!.length < 6 ? 'Enter a valid password' : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 40,),
                    SizedBox(
                      width: 90,
                      height: 32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                            primary: Colors.indigo.shade900),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .registerWithEmailandPassword(email, password);
                            if (result == null) {
                              loading = false;
                              setState(() => error = 'Enter a valid credentials');
                            } else {

                              Provider.of<Calculations>(context, listen: false).addtoUserData(context, {
                                'name': name,
                              });
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: Personal_Dashboard(),
                                      type: PageTransitionType.leftToRight));
                            }
                          }
                        },
                        child: Text('Sign in'),
                      ),
                    ),

                    const SizedBox(height: 10.0,),
                    Text(
                      error,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      child: const Text('Already have an account?',style: TextStyle(
                        fontFamily: 'Proxima',
                        fontSize:13,
                      ),),
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: Login(),
                                type: PageTransitionType.leftToRight));
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
