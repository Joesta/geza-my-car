import 'package:gezamycar/enums/auth-result-status.dart';
import 'package:gezamycar/exceptions/my_exception.dart';
import 'package:gezamycar/utils/constants.dart';

abstract class Person {
  String _fistName;
  String _lastName;
  String _gender;

  Person();
  Person.withParams(this._fistName, this._lastName, this._gender);

  void firstName(String firstName) => firstName.trim().isEmpty
      ? throw MyException(kFieldIsRequired)
      : _fistName = firstName;

  void lastName(String lastName) => lastName.trim().isEmpty
      ? throw MyException(kFieldIsRequired)
      : _lastName = lastName;

  void gender(String gender) => _gender = gender;

  String getFirstName() => _fistName;

  String getLastName() => _lastName;

  String getGender() => _gender;

  void signIn();

  Future<AuthResultStatus> signUp();

  void resetPassword();

  @override
  String toString() =>
      'FirstName: $_fistName, LastName: $_lastName, Gender: $_gender';
}
