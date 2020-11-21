import 'package:gezamycar/exceptions/my_exception.dart';
import 'package:gezamycar/utils/constants.dart';

class Address {
  String _addressLine;

  String get addressLine => _addressLine;

  set addressLine(String paramAddress) {
    paramAddress.isEmpty
        ? throw MyException(kFieldIsRequired)
        : _addressLine = paramAddress;
  }
}
