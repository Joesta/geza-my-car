import 'package:gezamycar/enums/auth-result-status.dart';
import 'package:gezamycar/exceptions/my_exception.dart';
import 'package:gezamycar/utils/constants.dart';

abstract class Person {
  String _fistName;
  String _lastName;
  String _idNumber;
  String _gender;
  String _photoUrl;

  Person();

  Person.withParams(
      this._fistName, this._lastName, this._gender, this._idNumber, this._photoUrl);

  void firstName(String firstName) {
    final RegExp regExp = RegExp('[a-zA-Z]');
    firstName.trim().isEmpty
        ? throw MyException(kFieldIsRequired)
        : !regExp.hasMatch(firstName)
            ? throw MyException(kInvalidInput)
            : firstName.length < 2
                ? throw MyException(kInvalidInputLength)
                : _fistName = firstName;
  }

  void lastName(String lastName) {
    final RegExp regExp = RegExp('[a-zA-Z]');
    lastName.trim().isEmpty
        ? throw MyException(kFieldIsRequired)
        : !regExp.hasMatch(lastName)
            ? throw MyException(kInvalidInput)
            : lastName.length < 2
                ? throw MyException(kInvalidInputLength)
                : _lastName = lastName;
  }

  void idNumber(String idNumber) {
    idNumber.isEmpty
        ? throw MyException(kFieldIsRequired)
        : idNumber.length < 13
            ? throw MyException(kIdNumberTooShort)
            : _idNumber = idNumber;
  }

  String getIdNumber() {
    return _idNumber;
  }


  String get photoUrl => _photoUrl;

  set photoUrl(String value) {
    _photoUrl = value;
  }

  void gender(String gender) => _gender = gender;

  String getFirstName() => _fistName;

  String getLastName() => _lastName;

  String getGender() => _gender;

  void signIn();

  Future<AuthResultStatus> signUp();

  void resetPassword();

  @override
  String toString() =>
      'FirstName: $_fistName, LastName: $_lastName, Gender: $_gender, IdNumber: $_idNumber';
}
