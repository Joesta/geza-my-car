import 'package:flutter/material.dart';

const kTextStyle = TextStyle(color: Colors.white);
const kButtonTextStyle = TextStyle(
  letterSpacing: 2.0,
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 20.0,
);

const kServiceTextStyle = TextStyle(color: Colors.black);

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
const kDbUserCollection = 'customer';
const kFieldIsRequired = 'Field is required';
const kPhoneShort = 'Phone number is too short';
const kInvalidEmail = 'Invalid email address';
const kPasswordShort = 'Password too short!';
const kPassMismatch = 'Password do not match';
const kPassInvalid = 'Only valid password allowed. E.G.&Gezamycar12';
const kInvalidPhone = 'Please provide valid phone';
const kInvalidInput = 'Invalid input';
const kInvalidInputLength = 'Field must be two or more characters';
const kIdNumberTooShort = 'Id number too short!. ID must be 13 digits long.';
const kIdNumberInvalid = 'Id Number invalid';

const kFirstName = 'firstName';
const kLastName = 'lastName';
const kGender = 'gender';
const kEmailAddress = 'emailAddres';
const kPhoneNumber = 'phoneNumber';
const kIdNumber = 'idNumber';
const kRole = 'role';
const kCreationTime = 'creationTime';
const kLstSignInTime = 'lastSignInTime';
const kPhotoUrl = 'photoUrl';

const kAuthType = 'authType';
const kUID = 'uid';


// services
const kEngineWashPrice = 100.00;
const kFullBodyWashPrice = 60.00;
const kFullBodyPolishingPrice = 50.00;
const kInteriorWashPrice = 85.00;

const kEngineWash = 'Engine wash  [$kEngineWashPrice]';
const kFullBodyWash = 'Full body wash [$kFullBodyWashPrice]';
const kFullBodyPolishing = 'Full body polishing [$kFullBodyPolishingPrice]';
const kInteriorWash = 'Interior Wash [$kInteriorWashPrice]';
/*
*
*     Service(name: kEngineWash, price: 100.0),
    Service(name: kFullBodyWash, price: 60.0),
    Service(name: kFullBodyPolishing, price: 50.0),
    Service(name: kInteriorWash, price: 85),*/

const kImageHolder = 'https://firebasestorage.googleapis.com/v0/b/geza-my-car.appspot.com/o/defaultUserImage%2Fplaceholder.png?alt=media&token=b942a6ac-b66f-4120-9000-e702dc234c8e';