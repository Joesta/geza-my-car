import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gezamycar/screens/bottom_nav_screen.dart';
import 'package:gezamycar/screens/login_screen.dart';
import 'package:gezamycar/utils/constants.dart';

class RootScreen extends StatefulWidget {
  static const String id = '/';
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final _storage = FlutterSecureStorage();
  String _uid;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _storage.read(key: kUID).then((value) => _uid = value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('RootScreen: uid $_uid');
    return _uid == null ? LoginScreen() : BottomNavScreen();
  }
}
