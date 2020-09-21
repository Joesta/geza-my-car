import 'package:flutter/cupertino.dart';
import 'package:gezamycar/screens/forgot_password_screen.dart';
import 'package:gezamycar/screens/home_screen.dart';
import 'package:gezamycar/screens/login_screen.dart';
import 'package:gezamycar/screens/signup_screen.dart';

final routes = {
  LoginScreen.id: (BuildContext context) => LoginScreen(),
  HomeScreen.id: (BuildContext context) => HomeScreen(),
  SignUpScreen.id: (BuildContext context) => SignUpScreen(),
  ForgotPasswordScreen.id: (BuildContext context) => ForgotPasswordScreen(),
};
