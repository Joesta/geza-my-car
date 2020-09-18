import 'package:flutter/material.dart';
import 'package:gezamycar/utils/constants.dart';

class CustomMaterialButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  CustomMaterialButton({@required this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5.0,
      height: 40.0,
      onPressed: onPressed,
      color: Colors.teal[700],
      minWidth: MediaQuery.of(context).size.width / 2,
      child: Text(
        title,
        style: kButtonTextStyle,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.teal,
          width: 2.0,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
