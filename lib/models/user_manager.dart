import 'package:firebase_auth/firebase_auth.dart';
import 'package:gezamycar/enums/auth-result-status.dart';
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

  Future<AuthResultStatus> signUp(String emailAddress, String password) async {
    return await _auth.singUp(emailAddress, password);
  }

  void saveUser(Person person) {
    person.id(getUID());
    print(person);
  }

  String getUID() => _auth.getUID();

  void logOut() {
    _auth.signOut().then((value) => null);
  }

  void registerUser(Person user) {}
}
