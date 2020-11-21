import 'package:gezamycar/enums/payment_type.dart';
import 'package:gezamycar/enums/service_state.dart';
import 'package:gezamycar/enums/service_type.dart';
import 'package:gezamycar/models/address.dart';
import 'package:gezamycar/models/service.dart';
import 'package:gezamycar/models/vehicle.dart';

class Payment {
  String _serviceType;
  Vehicle _vehicle;
  String _serviceState;
  PaymentType _paymentType;
  String _paymentDescription;
  double _amountDue;
  Service _service;
  String _date;
  Address _address;


  Address get address => _address;

  set address(Address value) {
    _address = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  Service get service => _service;

  set service(Service value) {
    _service = value;
  }

  double get amountDue => _amountDue;

  set amountDue (double value) {
    _amountDue = value;
  }

  String get serviceType => _serviceType;

  set serviceType(String value) {
    _serviceType = value;
  }

  Vehicle get vehicle => _vehicle;

  set vehicle(Vehicle value) {
    _vehicle = value;
  }

  String get serviceState => _serviceState;

  set serviceState(String value) {
    _serviceState = value;
  }

  PaymentType get paymentType => _paymentType;

  set paymentType(PaymentType value) {
    _paymentType = value;
  }

  String get paymentDescription => _paymentDescription;

  set paymentDescription(String value) {
    _paymentDescription = value;
  }

  Map<String, Object> toJson() {
    return {
      'serviceType': serviceType,
      'serviceState': serviceState,
      'amountDue': amountDue,
      'paymentType': 'cash',
      'service': service.serviceList,
      'vehicle': vehicle.toJson(),
      'date': date,
      'location': address?.addressLine
    };
  }

}