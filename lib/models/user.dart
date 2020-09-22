import 'package:gezamycar/enums/auth-result-status.dart';
import 'package:gezamycar/exceptions/my_exception.dart';
import 'package:gezamycar/mixins/credential_validation_mixin.dart';
import 'package:gezamycar/models/person.dart';
import 'package:gezamycar/models/user_manager.dart';
import 'package:gezamycar/utils/constants.dart';

class User extends Person with CredentialValidationMixin {
  String _role = 'User';
  String _emailAddress;
  String _password;
  String _phoneNumber;

  // set user role
  void role(String role) => _role = role;

  // validate email address
  void emailAddress(String emailAddress) {
    final result = validateEmail(emailAddress);
    result == null ? _emailAddress = emailAddress : throw MyException(result);
  }

  // validate password
  void password(String password) {
    final result = validatePassword(password);
    result == null ? _password = password : throw MyException(result);
  }

  void phoneNumber(String phoneNumber) => phoneNumber.trim().isEmpty
      ? throw MyException(kFieldIsRequired)
      : !_isValidPhoneLength(phoneNumber)
          ? MyException(kPhoneShort)
          : _phoneNumber = phoneNumber;

  // get user role
  String getRole() => _role;

  // get user password
  String getPassword() => _password;

  bool _isValidPhoneLength(String _phoneNumber) => _phoneNumber.length == 10;

  Map<String, Object> toJson() {
    return {
      'firstName': this.getFirstName(),
      'lastName': this.getLastName(),
      'gender': this.getGender(),
      'emailAddres': _emailAddress,
      'phoneNumber': _phoneNumber,
      'role': _role
    };
  }

  @override
  Future<AuthResultStatus> signUp() async {
    final manager = UserManager.instance;
    final status = await manager.signUp(_emailAddress, _password);

    if (status == AuthResultStatus.successful) {
      print('saving');
      try {
        await manager.saveUser(this);
      } catch (e) {
        //@Todo (developer) assign code to status
        print('SingUp: ${e.toString()}');
      }
      return status;
    }

    print('error occured');
    return status;
  }

  @override
  void login() {
    //Todo (developer) not done. check me later
    final manager = UserManager.instance;
    manager.login(_emailAddress, _password);
  }

  @override
  void resetPassword() {
    // TODO: implement resetPassword
  }

  @override
  String toString() =>
      '${super.toString()}, Role $_role, PhoneNumber: $_phoneNumber, Email Address: $_emailAddress';
}
