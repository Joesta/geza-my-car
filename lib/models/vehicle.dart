import 'package:gezamycar/exceptions/my_exception.dart';
import 'package:gezamycar/utils/constants.dart';

class Vehicle {
  String _make;
  String _color;
  String _registrationNo;

  String get make => _make;

  String get color => _color;

  String get registrationNo => _registrationNo;

  set make(String paramModel) {
    final RegExp regExp = RegExp('[a-zA-Z]');
    paramModel.isEmpty
        ? throw MyException(kFieldIsRequired)
        : !regExp.hasMatch(paramModel)
            ? throw MyException('Model contains unknown character(s)')
            : _make = paramModel;
  }

  set registrationNo(String paramRegistrationNo) {
    final RegExp regExp = RegExp('[a-zA-Z]');

    paramRegistrationNo.isEmpty
        ? throw MyException(kFieldIsRequired)
        : !regExp.hasMatch(paramRegistrationNo)
            ? throw MyException(
                'Registration number contain unknown character(s)')
            : _registrationNo = paramRegistrationNo;
  }

  set color(String paramColor) {
    final RegExp regExp = RegExp('[a-zA-Z]');
    paramColor.isEmpty
        ? throw MyException(kFieldIsRequired)
        : !regExp.hasMatch(paramColor)
            ? throw MyException('Color contain unknown character(s)')
            : _color = paramColor;
  }

  Map<String, Object> toJson() {
    return {
      'registrationNo': registrationNo,
      'make': make,
      'color': color
    };
  }
}
