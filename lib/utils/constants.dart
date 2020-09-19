import 'package:flutter/material.dart';

const kTextStyle = TextStyle(color: Colors.white);
const kButtonTextStyle = TextStyle(
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

const kFieldIsRequired = 'Field is required';
const kPhoneShort = 'Phone number is too short';
const kInvalidEmail = 'Invalid email address';
