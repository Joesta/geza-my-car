import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gezamycar/database/data_source.dart';
import 'package:gezamycar/enums/service_type.dart';
import 'package:gezamycar/models/address.dart';
import 'package:gezamycar/models/payment.dart';
import 'package:gezamycar/models/service.dart';
import 'package:gezamycar/models/vehicle.dart';
import 'package:gezamycar/utils/constants.dart';
import 'package:gezamycar/widgets/custom_material_button.dart';
import 'package:gezamycar/widgets/custom_text_form.dart';
import 'package:intl/intl.dart';



class ServiceScreen extends StatefulWidget {
  static const String id = 'ServiceScreen';

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final _serviceFormKey = GlobalKey<FormState>();

  bool _isOffSiteServiceType = false;
  ServiceType _serviceType = ServiceType.inHouse;

  final _dbs = DataSource();

  Vehicle _vehicle = Vehicle();
  Address _address = Address();

  double amountDue = 0;

  bool engineWash = false;
  bool bodyWash = false;
  bool bodyPolishing = false;
  bool interiorWash = false;

  // ServiceData _data = ServiceData();
  List<String> selectedServices = [];

  void _submit() async {
    debugPrint('Submit form clicked');
    if (selectedServices.isNotEmpty) {
      final form = _serviceFormKey.currentState;
      if (form.validate()) {
        debugPrint('valid form fields');
        // persist data
        Payment payment = Payment();

        if (_isOffSiteServiceType) {
          payment.address = _address;
        }

        final serviceType =  ServiceType.inHouse == _serviceType ? 'In-House':'Off-Site';
        payment.serviceType = serviceType;
        payment.vehicle = _vehicle;
        payment.serviceState = 'Queued';
        payment.amountDue = amountDue;
        payment.service = Service(serviceType, 'Queued', selectedServices);
        DateTime now = DateTime.now();
        payment.date = DateFormat.yMEd().add_jms().format(now);


        await _dbs.payService(payment);

      } else {

        debugPrint('Invalid form fields');
      }
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Select at least one service!'), duration: Duration(seconds: 3),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Container(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Card(
                    elevation: 5.0,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Service'),
                        ),
                        CheckboxListTile(
                          title: Text(kEngineWash),
                          value: engineWash,
                          onChanged: (value) {
                            if (value) {
                              setState(() {
                                engineWash = value;
                                amountDue += kEngineWashPrice;
                                selectedServices.add(kEngineWash);
                              });
                            } else {
                              setState(() {
                                engineWash = value;
                                amountDue -= kEngineWashPrice;
                                selectedServices.remove(kEngineWash);
                              });
                            }
                          },
                        ),
                        CheckboxListTile(
                          title: Text(kFullBodyWash),
                          value: bodyWash,
                          onChanged: (value) {
                            if (value) {
                              setState(() {
                                bodyWash = value;
                                amountDue += kFullBodyWashPrice;
                                selectedServices.add(kFullBodyWash);
                              });
                            } else {
                              setState(() {
                                bodyWash = value;
                                amountDue -= kFullBodyWashPrice;
                                selectedServices.remove(kFullBodyWash);
                              });
                            }
                          },
                        ),
                        CheckboxListTile(
                          title: Text(kFullBodyPolishing),
                          value: bodyPolishing,
                          onChanged: (value) {
                            if (value) {
                              setState(() {
                                bodyPolishing = value;
                                amountDue += kFullBodyPolishingPrice;
                                selectedServices.add(kFullBodyPolishing);
                              });
                            } else {
                              setState(() {
                                bodyPolishing = value;
                                amountDue -= kFullBodyPolishingPrice;
                                selectedServices.remove(kFullBodyPolishing);
                              });
                            }
                          },
                        ),
                        CheckboxListTile(
                          title: Text(kInteriorWash),
                          value: interiorWash,
                          onChanged: (value) {
                            if (value) {
                              setState(() {
                                interiorWash = value;
                                amountDue += kInteriorWashPrice;
                                selectedServices.add(kInteriorWash);
                              });
                            } else {
                              setState(() {
                                interiorWash = value;
                                amountDue -= kInteriorWashPrice;
                                selectedServices.remove(kInteriorWash);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 5.0,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Service Type'),
                        ),
                        RadioListTile<ServiceType>(
                            title: Text('In-House'),
                            value: ServiceType.inHouse,
                            groupValue: _serviceType,
                            onChanged: (value) {
                              setState(() {
                                _serviceType = value;
                                _isOffSiteServiceType = !_isOffSiteServiceType;
                              });
                            }),
                        RadioListTile<ServiceType>(
                            title: Text('Off-Site'),
                            value: ServiceType.offSite,
                            groupValue: _serviceType,
                            onChanged: (value) {
                              setState(() {
                                _serviceType = value;
                                _isOffSiteServiceType = !_isOffSiteServiceType;
                              });
                            }),
                      ],
                    ),
                  ),
                  Form(
                    key: _serviceFormKey,
                    child: Column(
                      children: [
                        Card(
                          elevation: 5.0,
                          clipBehavior: Clip.antiAlias,
                          color: Colors.grey[200],
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Vehicle details'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomTextFormField(
                                  labelText: 'Registration Numner',
                                  style: kServiceTextStyle,
                                  onChanged: null,
                                  validator: (String registrationNo) {
                                    try {
                                      _vehicle.registrationNo = registrationNo;
                                      return null;
                                    } catch (e) {
                                      return e.toString();
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomTextFormField(
                                  labelText: 'Model',
                                  style: kServiceTextStyle,
                                  onChanged: null,
                                  validator: (String make) {
                                    try {
                                      _vehicle.make = make;
                                      return null;
                                    } catch (e) {
                                      return e.toString();
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomTextFormField(
                                  labelText: 'Color',
                                  style: kServiceTextStyle,
                                  onChanged: null,
                                  validator: (String color) {
                                    try {
                                      _vehicle.color = color;
                                      return null;
                                    } catch (e) {
                                      return e.toString();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: _isOffSiteServiceType,
                          child: Card(
                            elevation: 5.0,
                            clipBehavior: Clip.antiAlias,
                            color: Colors.grey[200],
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text('Address'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CustomTextFormField(
                                    labelText: 'Address',
                                    style: kServiceTextStyle,
                                    hintText: '734 Park Street, Arcadia',
                                    onChanged: null,
                                    validator: (String address) {
                                      try {
                                        _address.addressLine = address;
                                        return null;
                                      } catch (e) {
                                        return e.toString();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5.0,
                          clipBehavior: Clip.antiAlias,
                          color: Colors.grey[200],
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.money_rounded),
                                title: Text('Amout due: R$amountDue'),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomMaterialButton(
                                      onPressed: _submit,
                                      title: 'Proceed',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
