import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gezamycar/managers/user_manager.dart';
import 'package:gezamycar/screens/bottom_nav_screen.dart';

import 'login_screen.dart';

class RootScreen extends StatefulWidget {
  static const String id = '/';

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final _manager = UserManager.instance;

  String _uid;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('RootScreen: uid $_uid');
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<User>(
          stream: _manager.currentUser,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Container(
                child: Center(
                  child: Text(snapshot.data.toString()),
                ),
              );

            if (snapshot.hasData) {
              User user = snapshot.data;
              return user == null ? LoginScreen() : BottomNavScreen();
            }

            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
