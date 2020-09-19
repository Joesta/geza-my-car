import 'package:gezamycar/models/person.dart';

class User extends Person {
  String _role = 'User';

  set setRole(String role) => _role = role;

  String get getRole => _role;

  @override
  void signUp() {
    // TODO: implement signUp
  }

  @override
  void login() {
    // TODO: implement login
  }

  @override
  void resetPassword() {
    // TODO: implement resetPassword
  }

  @override
  String toString() => 'Role: $_role, ${super.toString()}';
}
