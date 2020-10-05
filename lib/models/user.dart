import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_database/firebase_database.dart';
import 'package:gezamycar/enums/auth-result-status.dart';
import 'package:gezamycar/exceptions/my_exception.dart';
import 'package:gezamycar/managers/user_manager.dart';
import 'package:gezamycar/mixins/user_credential_validator_mixin.dart';
import 'package:gezamycar/models/person.dart';
import 'package:gezamycar/utils/constants.dart';

class User extends Person with UserCredentialValidatorMixin {
  String _role = 'User';
  String _emailAddress;
  String _password;
  String _phoneNumber;

  User() : super();

  User.withParams(String firstName, String lastName, String gender, String role,
      String emailAddress, String phoneNumber)
      : super.withParams(firstName, lastName, gender) {
    _role = role;
    _emailAddress = emailAddress;
    _phoneNumber = phoneNumber;
  }

  factory User.fromDataSnapshot(DataSnapshot snapshot) {
    var results = snapshot?.value;
    return User.withParams(
        results[kFirstName],
        results[kLastName],
        results[kGender],
        results[kRole],
        results[kEmailAddress],
        results[kPhoneNumber]);
  }

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

  String getPhoneNumber() => _phoneNumber;
  // get user role
  String getRole() => _role;

  String getEmailAddress() => _emailAddress;

  // get user password
  String getPassword() => _password;

  bool _isValidPhoneLength(String _phoneNumber) => _phoneNumber.length == 10;

  Map<String, Object> toJson() {
    final _manager = UserManager.instance;
    return {
      kFirstName: this.getFirstName(),
      kLastName: this.getLastName(),
      kGender: this.getGender(),
      kEmailAddress: _emailAddress,
      kPhoneNumber: _phoneNumber,
      kRole: _role,
      'creationTime': _manager.metadata.creationTime.toIso8601String(),
      'lastSignInTime': _manager.metadata.lastSignInTime.toIso8601String()
    };
  }

  @override
  Future<AuthResultStatus> signUp() async {
    final manager = UserManager.instance;
    final status = await manager.signUp(_emailAddress, _password);

    if (status == AuthResultStatus.successful) {
      print('saving');
      try {
        await manager.saveOrUpdate(this);
        return status;
      } catch (e) {
        //@Todo (developer) assign code to status
        print('SingUp: ${e.toString()}');
      }
    }

    print('error occured');
    return status;
  }

  @override
  Future<firebase.User> signIn() {
    //Todo (developer) not done. check me later
    final manager = UserManager.instance;
    return manager.signIn(_emailAddress, _password);
  }

  @override
  void resetPassword() {
    // TODO: implement resetPassword
  }

  @override
  String toString() =>
      '${super.toString()}, Role $_role, PhoneNumber: $_phoneNumber, Email Address: $_emailAddress';
}
