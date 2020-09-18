import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GezaMyApp());
}

class GezaMyApp extends StatefulWidget {
  @override
  _GezaMyAppState createState() => _GezaMyAppState();
}

class _GezaMyAppState extends State<GezaMyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: CustomTextFormField(
                        onChanged: null,
                        labelText: 'Email',
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                      child: CustomTextFormField(
                        onChanged: null,
                        labelText: 'Password',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final bool autoValidate;
  final bool isObscure;
  final Function onChanged;
  final String labelText;

  CustomTextFormField({
    @required this.onChanged,
    this.labelText,
    this.autoValidate = true,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      autovalidate: true,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.orange),
        labelText: labelText,
        filled: true,
        fillColor: Colors.white12,
        prefixIcon: Icon(
          Icons.email,
          color: Colors.redAccent,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.deepOrange,
            style: BorderStyle.solid,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
