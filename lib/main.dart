import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:gezamycar/screens/login_screen.dart';

import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('loading configs...');
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp();
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
