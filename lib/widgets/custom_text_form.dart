import 'package:flutter/material.dart';
import 'package:gezamycar/utils/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final bool autoValidate;
  final bool isObscure;
  final Function onChanged;
  final String labelText;
  final IconData icon;
  final Function validator;

  CustomTextFormField({
    @required this.onChanged,
    this.labelText,
    this.autoValidate = false,
    this.isObscure = false,
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
