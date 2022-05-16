// ignore_for_file: avoid_print, unused_element
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp1/model/user.dart' as myuser;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  myuser.MyUser _userFromFirebaseUser(User user) {
    return myuser.MyUser(uid: user.uid);
  }

  //auth change user stream
  Stream<myuser.MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  //anon
  Future loginAnon() async {
    try {
      UserCredential result = await _auth
          .signInAnonymously();
      User? user =
          result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //emailpass
  Future loginEmailPass(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(email);
      print(password);
      User? user =
          result.user;
          
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register emailpass

  Future signUpEmailPass(
      String _name, String _email, String _password, String _mobile) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      print(_email);
      print(_password);
      print(_name);
      print(_mobile);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return '';
    }
  }

  //signout

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}




