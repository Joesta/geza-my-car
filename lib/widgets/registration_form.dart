import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gezamycar/exceptions/my_exception.dart';
import 'package:gezamycar/models/contact.dart';
import 'package:gezamycar/models/person.dart';
import 'package:gezamycar/models/user.dart';
import 'package:gezamycar/utils/constants.dart';

import 'custom_text_form.dart';

class RegistrationForm extends StatelessWidget {
  final Person _user = User();
  final Contact _contact = Contact();
  final List<String> _genderTypes = [
    'Male',
    'Female',
  ];

  DropdownButton<String> androidDropdown(BuildContext context) {
    List<DropdownMenuItem<String>> genderItems = [];
    for (String gender in _genderTypes) {
      genderItems.add(
        DropdownMenuItem(
          child: Text(gender),
          value: gender,
        ),
      );
    }

    return DropdownButton(
      items: genderItems,
      onChanged: (_selectedItem) {
        // use set state to update value
        // assign to instance member
      },
    );
  }

  Widget iosPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (itemIndex) {
        // use set state to update value
        // assign to instance member
      },
      children: [
        Text(_genderTypes[0]),
        Text(_genderTypes[1]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    iosPicker();
    return Column(
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
          width: MediaQuery.of(context).size.width / 3 * 2,
          child: Platform.isIOS ? iosPicker() : androidDropdown(context),
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
    );
  }
}
