import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gezamycar/exceptions/my_exception.dart';
import 'package:gezamycar/models/contact.dart';
import 'package:gezamycar/models/person.dart';
import 'package:gezamycar/models/user.dart';
import 'package:gezamycar/utils/constants.dart';
import 'package:gezamycar/widgets/custom_material_button.dart';
import 'package:gezamycar/widgets/custom_text_form.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final Person _user = User();
  final Contact _contact = Contact();
  List<String> _genderTypes = ['Male', 'Female'];
  String _selectedGender;

  @override
  initState() {
    _selectedGender = _genderTypes[0];
    super.initState();
  }

  DropdownButton<String> androidDropdown(BuildContext context) {
    List<DropdownMenuItem<String>> genderItems = [];
    for (String gender in _genderTypes) {
      genderItems.add(
        DropdownMenuItem(
          child: Text(
            gender,
          ),
          value: _selectedGender,
        ),
      );
    }

    return DropdownButton(
      items: genderItems,
      onChanged: (_selectedItem) {
        setState(() {
          _selectedGender = _selectedItem;
        });
      },
    );
  }

  Widget iosPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      backgroundColor: Colors.white12,
      onSelectedItemChanged: (itemIndex) {
        setState(() {
          _selectedGender = _genderTypes[itemIndex];
        });
      },
      children: [
        Text(_genderTypes[0]),
        Text(_genderTypes[1]),
      ],
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      print(_user.toString());
      print('Success');
    }
  }

  void _clear() {
    _formKey.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: kBackgroundColor,
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            //@Todo (developer) minify this section
                            // find a way to put this form in a separate widget
                            children: <Widget>[
                              CustomTextFormField(
                                icon: Icons.person,
                                labelText: 'First Name',
                                onChanged: null,
                                validator: (String firstName) {
                                  try {
                                    _user.firstName(firstName);
                                    return null;
                                  } catch (e) {
                                    return e.toString();
                                  }
                                },
                              ),
                              SizedBox(height: 10.0),
                              CustomTextFormField(
                                icon: Icons.person,
                                labelText: 'Last Name',
                                onChanged: null,
                                validator: (String lastName) {
                                  try {
                                    _user.lastName(lastName);
                                    return null;
                                  } catch (e) {
                                    return e.toString();
                                  }
                                },
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                width:
                                    MediaQuery.of(context).size.width / 3 * 2,
                                child: Platform.isIOS
                                    ? iosPicker()
                                    : androidDropdown(context),
                              ),
                              SizedBox(height: 10.0),
                              CustomTextFormField(
                                isEmail: true,
                                isText: false,
                                icon: Icons.email,
                                labelText: 'Email Address',
                                onChanged: null,
                                validator: (String emailAddress) {
                                  try {
                                    _contact.setEmailAddress(emailAddress);
                                    return null;
                                  } catch (e) {
                                    return e.toString();
                                  }
                                },
                              ),
                              SizedBox(height: 10.0),
                              CustomTextFormField(
                                isPhone: true,
                                isText: false,
                                icon: Icons.phone,
                                labelText: 'Phone number',
                                onChanged: null,
                                validator: (String phoneNumber) {
                                  try {
                                    _contact.setPhoneNumber(phoneNumber);
                                    return null;
                                  } catch (e) {
                                    return e.toString();
                                  }
                                },
                              ),
                              SizedBox(height: 10.0),
                              CustomTextFormField(
                                isObscure: true,
                                icon: Icons.lock,
                                labelText: 'Password',
                                onChanged: null,
                                validator: (String password) {
                                  try {
                                    _user.password(password);
                                    return null;
                                  } catch (e) {
                                    return e.toString();
                                  }
                                },
                              ),
                              SizedBox(height: 10.0),
                              CustomTextFormField(
                                isObscure: true,
                                icon: Icons.lock,
                                labelText: 'Confirm password',
                                onChanged: null,
                                validator: (String password) {
                                  final _password = _user.getPassword();
                                  try {
                                    return _password == null
                                        ? throw MyException(kFieldIsRequired)
                                        : !(password == _password)
                                            ? throw MyException(kPassMismatch)
                                            : null;
                                  } catch (e) {
                                    return e.toString();
                                  }
                                },
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: CustomMaterialButton(
                              onPressed: () {
                                _submit();
                              },
                              title: 'Sign up',
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: CustomMaterialButton(
                              onPressed: _clear,
                              title: 'Clear',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
