import 'package:firebase_auth/firebase_auth.dart' as _firebase;
import 'package:gezamycar/models/contact.dart';
import 'package:gezamycar/models/person.dart';
import 'package:gezamycar/models/user_manager.dart';

class User extends Person {
  String _role = 'User';
  Contact _contact;
  UserManager _manager = UserManager.instance;

  void setRole(String role) => _role = role;

  void setContact(Contact contact) => _contact = contact;

  String getRole() => _role;

  Contact getContact() => _contact;

  @override
  void signUp() async {
    //Todo (developer) create node with user information when signup has completed.
    _firebase.User _user =
        await _manager.signUp(_contact.emailAddress, super.getPassword());
    if (_user != null) {
      print('user details below');
      print(this);
    }
  }

  @override
  void login() {
    //Todo (developer) not done. check me later
    _manager.login(_contact.emailAddress, super.getPassword());
  }

  @override
  void resetPassword() {
    // TODO: implement resetPassword
  }

  @override
  String toString() => 'Role: $_role, ${super.toString()}';
}
