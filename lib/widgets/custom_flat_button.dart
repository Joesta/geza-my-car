import 'package:flutter/material.dart';
import 'package:gezamycar/utils/constants.dart';

class CustomFlatButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  CustomFlatButton({@required this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: kTextStyle,
      ),
    );
  }
}
