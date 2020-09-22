import 'package:firebase_auth/firebase_auth.dart';
import 'package:gezamycar/enums/auth-result-status.dart';
import 'package:gezamycar/exceptions/auth-exception-handler.dart';
import 'package:gezamycar/exceptions/my_exception.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  AuthResultStatus _status;

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
  Future<AuthResultStatus> singUp(String emailAddress, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
      if (result.user != null) {
        _status = AuthResultStatus.successful;
      }
    } catch (e) {
      _status = AuthExceptionHandler.handleException(e);
    }

    return _status;
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
