import 'package:firebase_auth/firebase_auth.dart' as _firebase;
import 'package:gezamycar/exceptions/my_exception.dart';
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
  Future<int> signUp() async {
    //Todo (developer) create node with user information when signup has completed.

    try {
      _firebase.User _user =
          await _manager.signUp(_contact.emailAddress, super.getPassword());
      //@Todo remove debugging print
      print('Firebase user ${_user}');
      print('Firebase user ${_user.uid}');
      if (_user != null) {
        this.id(_user.uid);
        _manager.createUserDetails(this);
        return 1;
      }
    } catch (e) {
      throw MyException(e.toString());
    }

    return 0;
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
