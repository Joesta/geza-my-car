import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gezamycar/common/myflutter_alert.dart';
import 'package:gezamycar/enums/auth-result-status.dart';
import 'package:gezamycar/exceptions/auth-exception-handler.dart';
import 'package:gezamycar/exceptions/my_exception.dart';
import 'package:gezamycar/models/contact.dart';
import 'package:gezamycar/models/user.dart';
import 'package:gezamycar/screens/login_screen.dart';
import 'package:gezamycar/utils/constants.dart';
import 'package:gezamycar/widgets/custom_material_button.dart';
import 'package:gezamycar/widgets/custom_text_form.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final User _user = User();
  final Contact _contact = Contact();
  final _alert = MyFlutterAlert.instance;
  AuthResultStatus _status;

  bool _inAsyncCall = false;

  List<String> _genderTypes = ['Male', 'Female'];
  String _selectedGender;

  initState() {
    setState(() {
      _selectedGender = _genderTypes[0];
    });
    super.initState();
  }

  //@Todo (developer) move picker into a separate class to minify this class
  DropdownButton<String> androidDropdown(BuildContext context) {
    List<DropdownMenuItem<String>> genderItems = [];
    for (String gender in _genderTypes) {
      genderItems.add(
        DropdownMenuItem(
          child: Text(
            gender,
            style: kTextStyle,
          ),
          value: gender,
        ),
      );
    }

    return DropdownButton(
      value: _selectedGender,
      items: genderItems,
      dropdownColor: Colors.white10,
      onChanged: (_selectedItem) {
        setState(() {
          _selectedGender = _selectedItem;
          _user.gender(_selectedGender);
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
          _user.gender(_selectedGender);
        });
      },
      children: [
        Text(_genderTypes[0]),
        Text(_genderTypes[1]),
      ],
    );
  }

  Future<void> _submit() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      setState(() {
        _inAsyncCall = true;
      });

      _user.setContact(_contact);
      _status = await _user.signUp();
      if (_status == AuthResultStatus.successful) {
        setState(() {
          _inAsyncCall = !_inAsyncCall;
        });
        _clear(); // clear form
        _alert.showAlert(
            // shows alert
            context: context,
            onPressed: () => Navigator.popAndPushNamed(context, LoginScreen.id),
            alertType: AlertType.success,
            buttonText: 'Okay',
            description: 'User registered!');
      } else {
        final error = AuthExceptionHandler.generateExceptionMessage(_status);
        print(error);
        setState(() {
          _inAsyncCall = !_inAsyncCall;
        });
        _alert.showAlert(
            context: context,
            onPressed: () => Navigator.pop(context),
            alertType: AlertType.error,
            buttonText: 'Retry',
            description: error);
      }
    }
  }

  void _clear() {
    _formKey.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //@Todo (developer) see if you can move this to a separate class
          title: Text(
            'Sign up',
            style: TextStyle(letterSpacing: 2.0),
          ),
          backgroundColor: Colors.teal,
          elevation: 5.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: _inAsyncCall,
          progressIndicator: CircularProgressIndicator(
            backgroundColor: Colors.tealAccent,
          ),
          child: Container(
            color: kBackgroundColor,
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
                                SizedBox(height: kFormFieldHeightGap),
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
                                SizedBox(height: kFormFieldHeightGap),
                                Container(
                                  padding: EdgeInsets.only(left: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 3 * 2,
                                  child: Platform.isIOS
                                      ? iosPicker()
                                      : androidDropdown(context),
                                ),
                                SizedBox(height: kFormFieldHeightGap),
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
                                SizedBox(height: kFormFieldHeightGap),
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
                                SizedBox(height: kFormFieldHeightGap),
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
                                SizedBox(height: kFormFieldHeightGap),
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
                                SizedBox(height: kFormFieldHeightGap),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: CustomMaterialButton(
                                onPressed: () async {
                                  await _submit();
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
      ),
    );
  }
}
