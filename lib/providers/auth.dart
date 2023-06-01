import 'package:edo/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService
{
  // Instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String errorMessage='';
  String get getErrorMessage => errorMessage;
  //Pizato => _auth = firebaseAuth

  // Creating user object
  Userr? _userFromFirebaseUser(User? user)
  {
    return user!=null? Userr(uid: user.uid) : null;
  }

  // Auth change listener
  Stream<Userr?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));
  }

  // Signing in Anonymously
  Future signInAnon() async
  {
    try
    {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      // Userr? instance = _userFromFirebaseUser(user);
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  // register with mail and pass
  Future registerWithEmailandPassword(String email,String password) async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try
    {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      sharedPreferences.setString('uid',  Userr(uid: user!.uid).uid);
      // Userr? instance = _userFromFirebaseUser(user);
      // create a new doc
      // await DatabaseService(uid: user!.uid).updateUserData('0','new user', 100);
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  // login in with mail and pass
  Future loginWithEmailandPassword(String email,String password) async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try
    {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      //Pizzato => result => userCredential

      // print(result);
      User? user = result.user;
      sharedPreferences.setString('uid',  Userr(uid: user!.uid).uid);
      // print(user);
      // Userr? instance = _userFromFirebaseUser(user);
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      switch(e)
      {
          case 'user-not-found':
            errorMessage = 'User not found';
            print(errorMessage);
            break;

          case 'wrong-password':
            errorMessage = 'Oops! Wrong password';
            print(errorMessage);
            break;

          case 'invalid-email':
            errorMessage = 'Sorry! Invalid Email';
            print(errorMessage);
            break;
      }
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async
  {
    try
    {
      return await _auth.signOut();
    }
    catch(e)
    {
      switch(e)
      {
        case 'account-exits-with-different-credential':
          errorMessage = 'User not found';
          print(errorMessage);
          break;

        case 'invalid-email':
          errorMessage = 'Sorry! Invalid Email';
          print(errorMessage);
          break;
      }
      print(e.toString());
      return null;
    }
  }
}