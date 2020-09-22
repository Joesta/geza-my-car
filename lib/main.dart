import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:gezamycar/screens/login_screen.dart';
import 'package:gezamycar/utils/firebaseapp_initializer.dart';

import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('loading configs...');
  final configs = await FlutterConfig.loadEnvVariables();
  if (configs != null) {
    print('configs loaded...');
    print('initializing app...');
    await FirebaseAppInitializer.initApp();
    print('initialized...');
  }

  print('running applications...');
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
