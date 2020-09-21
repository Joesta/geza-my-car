import 'package:email_validator/email_validator.dart';
import 'package:gezamycar/utils/constants.dart';
import 'package:gezamycar/utils/form_validators.dart';

import 'file:///C:/Users/mogokong/AndroidStudioProjects/geza_my_car/lib/exceptions/my_exception.dart';

class Contact extends FormValidator {
  String _id;
  String _phoneNumber;
  String _emailAddress;

  void setPhoneNumber(String _phoneNumber) {
    if (_phoneNumber.trim().isEmpty) {
      throw MyException(kFieldIsRequired);
    } else if (!_isValidPhoneLength(_phoneNumber)) {
      throw MyException(kPhoneShort);
    }

    this._phoneNumber = _phoneNumber;
  }

  void setEmailAddress(String _emailAddress) {
    if (_emailAddress.trim().isEmpty) {
      throw MyException(kFieldIsRequired);
    } else if (!EmailValidator.validate(_emailAddress)) {
      throw MyException(kInvalidEmail);
    }

    this._emailAddress = _emailAddress;
  }

  bool _isValidPhoneLength(String _phoneNumber) {
    print(_phoneNumber.length);
    print(_phoneNumber.length == 10);
    return _phoneNumber.length == 10;
  }

  String get emailAddress => this._emailAddress;

  String get phoneNumber => this._phoneNumber;

  String get id => this.id;

  @override
  String toString() => 'Phone: $_phoneNumber, Email: $_emailAddress';
}
