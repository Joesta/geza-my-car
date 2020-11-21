import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gezamycar/common/myflutter_alert.dart';
import 'package:gezamycar/exceptions/auth-exception-handler.dart';
import 'package:gezamycar/managers/user_manager.dart';
import 'package:gezamycar/screens/bottom_nav_screen.dart';
import 'package:gezamycar/screens/reset_password_screen.dart';
import 'package:gezamycar/screens/signup_screen.dart';
import 'package:gezamycar/utils/constants.dart';
import 'package:gezamycar/utils/form_validators.dart';
import 'package:gezamycar/widgets/custom_flat_button.dart';
import 'package:gezamycar/widgets/custom_material_button.dart';
import 'package:gezamycar/widgets/custom_text_form.dart';
import 'package:gezamycar/widgets/login_text_anim.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _storage = FlutterSecureStorage();
  String _email, _password;
  bool _inAsyncCall = false;
  final resetAlert = MyFlutterAlert.instance;

  void _submit() async {
    final form = _formKey.currentState;
    final _manager = UserManager.instance;

    if (form.validate()) {
      _updateAsyncCallState();

      print(_email);
      print(_password);
      try {
        // firebase user
        firebase.User user = await _manager.signIn(_email, _password);
        if (user != null) {
          await _storage.write(key: kUID, value: user.uid);
          _manager.updateLastSignInTime();
          _updateAsyncCallState();

          print('success');
          //@Todo (Developer) goto main screen
          Navigator.pushReplacementNamed(context, BottomNavScreen.id);
        }
      }on FirebaseAuthException catch (e) {
        _updateAsyncCallState();

        //show alert
        resetAlert.showAlert(
            buttonText: 'OK',
            onPressed: () => Navigator.popAndPushNamed(context, LoginScreen.id),
            context: context,
            alertType: AlertType.error,
            description: e.message);

        print('submit: ${e.message}');
      }
    }
  }

  _updateAsyncCallState() {
    setState(() {
      _inAsyncCall = !_inAsyncCall;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: _inAsyncCall,
          child: Container(
            color: kBackgroundColor,
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: LoginTextAnim(headingText: 'GEZA MY CAR'),
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
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                CustomTextFormField(
                                  onChanged: (String email) {
                                    _email = email.trim();
                                  },
                                  labelText: 'Email',
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
                                CustomTextFormField(
                                  onChanged: (String password) {
                                    _password = password.trim();
                                  },
                                  labelText: 'Password',
                                  icon: Icons.lock,
                                  isObscure: true,
                                  validator: (String _password) {
                                    return FormValidator.validatePassword(
                                        password: _password);
                                  },
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                CustomMaterialButton(
                                  onPressed: _submit,
                                  title: 'Login',
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CustomFlatButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, ResetPasswordScreen.id);
                                      },
                                      title: "Reset Password",
                                    ),
                                    Text(
                                      '|',
                                      style: kTextStyle,
                                    ),
                                    CustomFlatButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, SignUpScreen.id);
                                      },
                                      title: "Create an account",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
