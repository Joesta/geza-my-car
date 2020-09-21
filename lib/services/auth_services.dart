import 'package:firebase_auth/firebase_auth.dart';
import 'package:gezamycar/exceptions/my_exception.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  // signIn user
  Future<User> signIn(String emailAddress, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      return result.user;
    } catch (e) {
      throw MyException(e);
    }
  }

  // create user account
  Future<User> singUp(String emailAddress, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
      return result.user;
    } catch (e) {
      throw MyException(e.toString());
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
  Future<void> resetPassword(String emailAddress) async {
    return await _auth.sendPasswordResetEmail(email: emailAddress);
  }

  // logout
  Future<void> signOut() {
    return _auth.signOut();
  }
}
