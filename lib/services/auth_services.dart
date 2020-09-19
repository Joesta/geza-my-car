import 'package:firebase_auth/firebase_auth.dart';

import 'file:///C:/Users/mogokong/AndroidStudioProjects/geza_my_car/lib/exceptions/my_exception.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  // signIn user
  Future<User> signIn(String _email, String _password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      return result.user;
    } catch (e) {
      throw MyException(e);
    }
  }

  // create user account
  Future<User> singUp(String _email, String _password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      return result.user;
    } catch (e) {
      throw MyException(e);
    }
  }

  // current user
  User getCurrentUser() {
    return _auth.currentUser;
  }

  // get uid
  String getUID() {
    return getCurrentUser().uid;
  }

  // reset password
  Future<void> resetPassword(String _email) async {
    return await _auth.sendPasswordResetEmail(email: _email);
  }

  // logout
  Future<void> signOut() {
    return _auth.signOut();
  }
}
