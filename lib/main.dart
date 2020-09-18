import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gezamycar/screens/login_screen.dart';

void main() {
  runApp(GezaMyApp());
}

class GezaMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
