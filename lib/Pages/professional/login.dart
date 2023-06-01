import 'package:edo/Pages/personal/Dashboard/dashboard_personal.dart';
import 'package:edo/Pages/personal/create_acc.dart';
import 'package:edo/Pages/professional/dashboard/dashboard_professional.dart';
import 'package:edo/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
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
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Proxima',
                        letterSpacing: 1.3,
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
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
                                .loginWithEmailandPassword(email, password);
                            if (result == null) {
                              loading = false;
                              setState(() => error = 'Enter a valid credentials');
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: Pro_Dashboard(),
                                      type: PageTransitionType.leftToRight));
                            }
                          }
                        },
                        child: Text('Login'),
                      ),
                    ),

                    const SizedBox(height: 10.0,),
                    Text(
                      error,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
              ),
            ),
          )),
    );
  }
}
