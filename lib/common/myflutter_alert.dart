import 'package:flutter/material.dart';
import 'package:gezamycar/utils/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyFlutterAlert {
  MyFlutterAlert._internal();

  static final instance = MyFlutterAlert._internal();

  factory MyFlutterAlert() {
    return instance;
  }

  void showAlert(
      {BuildContext context,
      @required Function onPressed,
      AlertType alertType,
      String description,
      String buttonText}) {
    Alert(
      context: context,
      type: alertType,
      title: '',
      desc: description,
      buttons: [
        DialogButton(
          child: Text(
            buttonText,
            style: kTextStyle.copyWith(
              fontSize: 20.0,
            ),
          ),
          onPressed: onPressed,
          width: 120,
        )
      ],
    ).show();
  }
}
