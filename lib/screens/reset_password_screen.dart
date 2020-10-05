import 'package:flutter/material.dart';
import 'package:gezamycar/common/myflutter_alert.dart';
import 'package:gezamycar/enums/auth-result-status.dart';
import 'package:gezamycar/exceptions/auth-exception-handler.dart';
import 'package:gezamycar/utils/constants.dart';
import 'package:gezamycar/utils/form_validators.dart';
import 'package:gezamycar/widgets/custom_material_button.dart';
import 'package:gezamycar/widgets/custom_text_form.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'file:///C:/Users/mogokong/AndroidStudioProjects/geza_my_car/lib/managers/user_manager.dart';

import '../widgets/custom_text_form.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String id = 'ForgotPasswordScreen';

  @override
  _ForgotPasswordScreen createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  final _formKey0 = GlobalKey<FormState>();
  final resetAlert = MyFlutterAlert.instance;
  String _email;
  AuthResultStatus _emailStatus;
  bool _inAsyncCall = false;

  void _submitRestForm() async {
    final form = _formKey0.currentState;
    final _manager = UserManager.instance;

    if (form.validate()) {
      print(_email);

      setState(() {
        _inAsyncCall = true;
      });
      _emailStatus = await _manager.resetPassword(_email);

      if (_emailStatus == AuthResultStatus.successful) {
        //show alert
        resetAlert.showAlert(
            buttonText: 'OK',
            onPressed: () => Navigator.popAndPushNamed(context, LoginScreen.id),
            context: context,
            alertType: AlertType.success,
            description: 'Reset link sent!');
      } else {
        //show alert
        resetAlert.showAlert(
            buttonText: 'OK',
            onPressed: () =>
                Navigator.popAndPushNamed(context, ForgotPasswordScreen.id),
            context: context,
            alertType: AlertType.error,
            description:
                AuthExceptionHandler.generateExceptionMessage(_emailStatus));
      }
    }
    setState(() {
      _inAsyncCall = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Reset password',
            style: TextStyle(letterSpacing: 2.0),
          ),
          backgroundColor: Colors.teal,
          elevation: 5.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: _inAsyncCall,
          progressIndicator: CircularProgressIndicator(
            backgroundColor: Colors.tealAccent,
          ),
          child: Container(
            color: kBackgroundColor,
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                // child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      // child: LoginTextAnim(headingText: 'GEZA MY CAR', ),
                      child: Text(
                        'Reset password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Form(
                            key: _formKey0,
                            child: Column(
                              children: <Widget>[
                                CustomTextFormField(
                                  onChanged: null,
                                  labelText: 'Email address',
                                  isText: false,
                                  isEmail: true,
                                  icon: Icons.email,
                                  validator: (String _email) {
                                    return FormValidator.validateEmail(
                                        email: _email);
                                  },
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                CustomMaterialButton(
                                  onPressed: _submitRestForm,
                                  title: 'Reset',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
