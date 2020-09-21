import 'package:gezamycar/enums/auth-result-status.dart';
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
  Future<AuthResultStatus> signUp() async {
    final status =
        await _manager.signUp(_contact.emailAddress, super.getPassword());
    if (status == AuthResultStatus.successful) {
      print('saving');
      _manager.saveUser(this);
      return status;
    }

    print('error occured');
    return status;
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
