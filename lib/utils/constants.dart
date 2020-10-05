import 'package:flutter/material.dart';

const kTextStyle = TextStyle(color: Colors.white);
const kButtonTextStyle = TextStyle(
  letterSpacing: 2.0,
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 20.0,
);

const kBackgroundColor = Colors.black87;

const kTextFormInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.grey),
  labelText: 'labelText',
  filled: true,
  fillColor: Colors.white12,
  prefixIcon: null,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);

const kFormFieldHeightGap = 15.0;
const kDbUserCollection = 'User';
const kFieldIsRequired = 'Field is required';
const kPhoneShort = 'Phone number is too short';
const kInvalidEmail = 'Invalid email address';
const kPasswordShort = 'Password too short!';
const kPassMismatch = 'Password do not match';

const kFirstName = 'firstName';
const kLastName = 'lastName';
const kGender = 'gender';
const kEmailAddress = 'emailAddres';
const kPhoneNumber = 'phoneNumber';
const kRole = 'role';
const kCreationTime = 'creationTime';
const kLstSignInTime = 'lastSignInTime';

const kAuthType = 'authType';
const kUID = 'uid';
