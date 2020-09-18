import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gezamycar/utils/form_validators.dart';
import 'package:gezamycar/widgets/custom_text_form.dart';
import 'package:gezamycar/widgets/login_text_anim.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      print('Valid inputs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black87,
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
                                onChanged: (_) {},
                                labelText: 'Email',
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
                                onChanged: (_) {},
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
                              MaterialButton(
                                elevation: 5.0,
                                height: 40.0,
                                onPressed: _submit,
                                color: Colors.tealAccent,
                                minWidth: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                    color: Colors.teal,
                                    width: 2.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
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
    );
  }
}
