import 'package:flutter/cupertino.dart';
import 'package:gezamycar/screens/create_account_screen.dart';
import 'package:gezamycar/screens/forgot_password_screen.dart';
import 'package:gezamycar/screens/home_screen.dart';
import 'package:gezamycar/screens/login_screen.dart';

final routes = {
  LoginScreen.id: (BuildContext context) => LoginScreen(),
  HomeScreen.id: (BuildContext context) => HomeScreen(),
  CreateAccountScreen.id: (BuildContext context) => CreateAccountScreen(),
  ForgotPasswordScreen.id: (BuildContext context) => ForgotPasswordScreen(),
};
