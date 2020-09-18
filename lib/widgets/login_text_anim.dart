import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LoginTextAnim extends StatelessWidget {
  final String headingText;

  LoginTextAnim({this.headingText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      child: TextLiquidFill(
        boxBackgroundColor: Colors.black87,
        text: headingText,
        waveColor: Colors.white,
        textStyle: TextStyle(
          fontFamily: 'KaushanScript-Regular',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        boxHeight: 80.0,
      ),
    );
  }
}
