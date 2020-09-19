import 'package:gezamycar/models/person.dart';

class User extends Person {
  String role;

  User(String uid, String firstName, String lastName, String gender,
      String password)
      : super(uid, firstName, lastName, gender, password);

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
}
