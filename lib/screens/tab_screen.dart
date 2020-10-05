import 'package:flutter/material.dart';
import 'package:gezamycar/screens/profile_screen.dart';
import 'package:gezamycar/screens/service_screen.dart';
import 'package:gezamycar/screens/settings_screen.dart';

class TabScreen extends StatelessWidget {
  static const String id = 'TabScreen';
  final List<Widget> screenList = [
    ProfileScreen(),
    ServiceScreen(),
    SettingsScreen()
  ];
  final int index;
  TabScreen({this.index});

  @override
  Widget build(BuildContext context) {
    return screenList[index];
  }
}
