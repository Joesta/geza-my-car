import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gezamycar/screens/forgot_password_screen.dart';
import 'package:gezamycar/screens/home_screen.dart';
import 'package:gezamycar/screens/signup_screen.dart';
import 'package:gezamycar/services/auth_services.dart';
import 'package:gezamycar/utils/constants.dart';
import 'package:gezamycar/utils/form_validators.dart';
import 'package:gezamycar/widgets/custom_flat_button.dart';
import 'package:gezamycar/widgets/custom_material_button.dart';
import 'package:gezamycar/widgets/custom_text_form.dart';
import 'package:gezamycar/widgets/login_text_anim.dart';
class LoginScreen extends StatefulWidget {
  static const String id = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  void _submit() async {
    final form = _formKey.currentState;
    final _auth = AuthServices();

    if (form.validate()) {
      print(_email);
      print(_password);
      try {
        User user = await _auth.signIn(_email, _password);
        if (user != null) {
          print('success');
          //@Todo (Developer) goto main screen
          Navigator.pushNamed(context, HomeScreen.id);
        } else {}
      } catch (e) {
        print('submit: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: kBackgroundColor,
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    child: LoginTextAnim(headingText: 'GEZA MY CAR'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              CustomTextFormField(
                                onChanged: (String email) {
                                  _email = email.trim();
                                },
                                labelText: 'Email',
                                isText: false,
                                isEmail: true,
                                icon: Icons.email,
                                validator: (String _email) {
                                  return FormValidator.validateEmail(
                                      email: _email);
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              CustomTextFormField(
                                onChanged: (String password) {
                                  _password = password.trim();
                                },
                                labelText: 'Password',
                                icon: Icons.lock,
                                isObscure: true,
                                validator: (String _password) {
                                  return FormValidator.validatePassword(
                                      password: _password);
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              CustomMaterialButton(
                                onPressed: _submit,
                                title: 'Login',
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CustomFlatButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, ForgotPasswordScreen.id);
                                    },
                                    title: "Reset Password",
                                  ),
                                  Text(
                                    '|',
                                    style: kTextStyle,
                                  ),
                                  CustomFlatButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, SignUpScreen.id);
                                    },
                                    title: "Create an account",
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
