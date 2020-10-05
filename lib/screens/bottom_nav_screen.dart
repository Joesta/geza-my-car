import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gezamycar/screens/tab_screen.dart';
import 'package:gezamycar/utils/constants.dart';

class BottomNavScreen extends StatefulWidget {
  static const String id = 'BottomNavScreen';
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Icon> _screenList = [
    Icon(Icons.person_pin),
    Icon(Icons.local_car_wash),
    Icon(Icons.settings),
  ];

  int _currentScreenIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          items: _screenList,
          index: _currentScreenIndex,
          backgroundColor: kBackgroundColor,
          height: 60.0,
          onTap: (index) {
            setState(() {
              _currentScreenIndex = index;
            });
          },
        ),
        body: TabScreen(index: _currentScreenIndex),
      ),
    );
  }
}
