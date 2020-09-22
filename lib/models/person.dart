import 'package:gezamycar/enums/auth-result-status.dart';
import 'package:gezamycar/exceptions/my_exception.dart';
import 'package:gezamycar/utils/constants.dart';

abstract class Person {
  String _uid;
  String _fistName;
  String _lastName;
  String _gender;

  void id(String uid) => _uid = uid;

  void firstName(String firstName) => firstName.trim().isEmpty
      ? throw MyException(kFieldIsRequired)
      : _fistName = firstName;

  void lastName(String lastName) => lastName.trim().isEmpty
      ? throw MyException(kFieldIsRequired)
      : _lastName = lastName;

  void gender(String gender) => _gender = gender;

  String getUid() => _uid;

  String getFirstName() => _fistName;

  String getLastName() => _lastName;

  String getGender() => _gender;

  void login();

  Future<AuthResultStatus> signUp();

  void resetPassword();

  @override
  String toString() =>
      'Id: $_uid, FirstName: $_fistName, LastName: $_lastName, Gender: $_gender';
}
