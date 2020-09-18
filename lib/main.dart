import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gezamycar/screens/login_screen.dart';

import 'routes.dart';

void main() {
  runApp(GezaMyApp());
}

class GezaMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: routes,
    );
  }
}
