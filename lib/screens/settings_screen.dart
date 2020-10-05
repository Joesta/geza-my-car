import 'package:flutter/material.dart';
import 'package:gezamycar/utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = 'SettingsScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Container(
          child: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
