import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gezamycar/utils/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final bool autoValidate;
  final bool isObscure;
  final bool isText;
  final bool isEmail;
  final bool isPhone;
  final bool isEnabled;
  final bool isDigit;
  final initialValue;
  final Function onChanged;
  final String labelText;
  final IconData icon;
  final Function validator;
  final InputDecoration decoration;
  final String hintText;
  final TextStyle style;

  CustomTextFormField({
    @required this.onChanged,
    this.labelText,
    this.initialValue = '',
    this.autoValidate = false,
    this.isObscure = false,
    this.isText = true,
    this.isEmail = false,
    this.isPhone = false,
    this.isEnabled = true,
    this.isDigit = false,
    this.icon,
    this.validator,
    this.decoration,
    this.hintText,
    this.style
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      autovalidate: autoValidate,
      initialValue: initialValue,
      obscureText: isObscure,
      maxLength: isPhone ? 10 : isDigit ? 13 : null,
      cursorColor: Colors.teal,
      enabled: isEnabled,
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : isPhone ? TextInputType.phone : isDigit ? TextInputType.number : TextInputType.text,
      style: style ?? kTextStyle,
      decoration: decoration ?? kTextFormInputDecoration.copyWith(
        labelText: labelText,
        hintText: hintText ?? null,
        hintStyle: TextStyle(color: Colors.grey[500]),

        prefixIcon: Icon(
          icon,
          color: Colors.teal,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.teal,
            style: BorderStyle.solid,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
