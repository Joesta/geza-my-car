import 'package:flutter/material.dart';

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
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.grey),
        labelText: labelText,
        filled: true,
        fillColor: Colors.white12,
        prefixIcon: Icon(
          icon,
          color: Colors.teal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
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
