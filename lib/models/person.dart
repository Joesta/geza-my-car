import 'package:gezamycar/exceptions/my_exception.dart';
import 'package:gezamycar/utils/constants.dart';

abstract class Person {
  String _uid;
  String _fistName;
  String _lastName;
  String _gender;
  String _password;

  void id(String uid) => _uid = uid;

  void firstName(String firstName) => firstName.trim().isEmpty
      ? throw MyException(kFieldIsRequired)
      : _fistName = firstName;

  void lastName(String lastName) => lastName.trim().isEmpty
      ? throw MyException(kFieldIsRequired)
      : _lastName = lastName;

  void password(String password) => password.isEmpty
      ? throw MyException(kFieldIsRequired)
      : !_isValidPassword(password)
          ? throw MyException(kPasswordShort)
          : _password = password;

  void gender(String gender) => _gender = gender;

  String getUid() => _uid;

  String getFirstName() => _fistName;

  String getLastName() => _lastName;

  String getGender() => _gender;

  String getPassword() => _password;

  void login();

  Future<int> signUp();

  void resetPassword();

  bool _isValidPassword(String password) => password.length > 6;

  @override
  String toString() =>
      'FirstName: $_fistName, LastName: $_lastName, Gender: $_gender';
}
