import 'package:firebase_auth/firebase_auth.dart';
import 'package:gezamycar/exceptions/my_exception.dart';
import 'package:gezamycar/models/person.dart';
import 'package:gezamycar/services/auth_services.dart';

class UserManager {
  final _auth = AuthServices();

  UserManager._internal();
  static final instance = UserManager._internal();

  factory UserManager() {
    return instance;
  }

  Future<User> login(String emailAddress, String password) async {
    return await _auth.signIn(emailAddress, password);
  }

  Future<User> signUp(String emailAddress, String password) async {
    try {
      return await _auth.singUp(emailAddress, password);
    } catch (e) {
      throw MyException(e.toString());
    }
  }

  void createUserDetails(Person person) {
    print('UserManager: ${person.toString()}');
  }

  void logOut() {
    _auth.signOut().then((value) => null);
  }

  void registerUser(Person user) {}
}
