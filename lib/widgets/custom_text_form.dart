import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gezamycar/utils/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final bool autoValidate;
  final bool isObscure;
  final bool isText;
  final bool isEmail;
  final bool isPhone;
  final Function onChanged;
  final String labelText;
  final IconData icon;
  final Function validator;

  CustomTextFormField({
    @required this.onChanged,
    this.labelText,
    this.autoValidate = false,
    this.isObscure = false,
    this.isText = true,
    this.isEmail = false,
    this.isPhone = false,
    this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      autovalidate: autoValidate,
      obscureText: isObscure,
      maxLength: isPhone ? 10 : null,
      cursorColor: Colors.teal,
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : isPhone ? TextInputType.phone : TextInputType.text,
      style: kTextStyle,
      decoration: kTextFormInputDecoration.copyWith(
        labelText: labelText,
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
