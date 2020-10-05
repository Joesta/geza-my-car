import 'package:flutter/material.dart';
import 'package:gezamycar/utils/constants.dart';

class ServiceScreen extends StatelessWidget {
  static const String id = 'ServiceScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Container(
          child: Text(
            'Services',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
