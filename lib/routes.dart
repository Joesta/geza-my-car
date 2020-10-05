import 'package:flutter/cupertino.dart';
import 'package:gezamycar/screens/bottom_nav_screen.dart';
import 'package:gezamycar/screens/home_screen.dart';
import 'package:gezamycar/screens/login_screen.dart';
import 'package:gezamycar/screens/profile_edit_screen.dart';
import 'package:gezamycar/screens/reset_password_screen.dart';
import 'package:gezamycar/screens/root_screen.dart';
import 'package:gezamycar/screens/signup_screen.dart';

final routes = {
  RootScreen.id: (BuildContext context) => RootScreen(),
  LoginScreen.id: (BuildContext context) => LoginScreen(),
  BottomNavScreen.id: (BuildContext context) => BottomNavScreen(),
  HomeScreen.id: (BuildContext context) => HomeScreen(),
  SignUpScreen.id: (BuildContext context) => SignUpScreen(),
  ResetPasswordScreen.id: (BuildContext context) => ResetPasswordScreen(),
  ProfileEditScreen.id: (BuildContext context) => ProfileEditScreen(),
};
