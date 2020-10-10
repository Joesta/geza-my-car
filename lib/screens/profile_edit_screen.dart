import 'package:flutter/material.dart';
import 'package:gezamycar/managers/user_manager.dart';
import 'package:gezamycar/models/user.dart';
import 'package:gezamycar/shared/flash_helper.dart';
import 'package:gezamycar/utils/constants.dart';
import 'package:gezamycar/widgets/custom_material_button.dart';
import 'package:gezamycar/widgets/custom_text_form.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ProfileEditScreen extends StatefulWidget {
  static const String id = 'ProfileEditScreen';

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _profileFormKey = GlobalKey<FormState>();
  final GlobalKey _toolTipKey = GlobalKey();
  User _user;
  bool _inAsyncCall = false;

  _updateAsyncCallState() {
    setState(() {
      _inAsyncCall = !_inAsyncCall;
    });
  }

  void _submit() async {
    final form = _profileFormKey.currentState;
    if (form.validate()) {
      _updateAsyncCallState();

      try {
        print(_user.toString());

        final manager = UserManager.instance;
        print('New user details ${_user.toString()}');
        await manager.saveOrUpdate(_user);
        _updateAsyncCallState();
        FlashHelper.successBar(context, message: 'Profile updated succesfully');
      } catch (e) {
        _updateAsyncCallState();
        print(e);
      }
    }
  }

  @override
  @override
  void dispose() {
    print('dispose running...');
    FlashHelper.dispose();
    super.dispose();
  }

  @override
  void initState() {
    print('initstate running...');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _user = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Update Profile',
            style: TextStyle(letterSpacing: 2.0),
          ),
          backgroundColor: Colors.white24.withOpacity(.2),
        ),
        backgroundColor: kBackgroundColor,
        body: ModalProgressHUD(
          inAsyncCall: _inAsyncCall,
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Form(
                    key: _profileFormKey,
                    child: Column(
                      children: [
                        Hero(
                          tag: 'editProfile',
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('images/placeholder.png'),
                            radius: 120.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 2.0,
                          width: MediaQuery.of(context).size.width / 2,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomTextFormField(
                          onChanged: null,
                          icon: Icons.person_pin,
                          labelText: 'First Name',
                          initialValue: _user.getFirstName(),
                          isText: true,
                          validator: (value) {
                            try {
                              _user.firstName(value);
                              return null;
                            } catch (e) {
                              return e.toString();
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextFormField(
                          onChanged: null,
                          icon: Icons.person_pin,
                          labelText: 'Last Name',
                          initialValue: _user.getLastName(),
                          isText: true,
                          validator: (value) {
                            try {
                              _user.lastName(value);
                              return null;
                            } catch (e) {
                              return e.toString();
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextFormField(
                          onChanged: null,
                          icon: Icons.phone_in_talk,
                          labelText: 'Phone Number',
                          initialValue: _user.getPhoneNumber(),
                          isText: false,
                          isPhone: true,
                          validator: (value) {
                            try {
                              _user.phoneNumber(value);
                              return null;
                            } catch (e) {
                              return e.toString();
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            final dynamic tooltip = _toolTipKey.currentState;
                            tooltip.ensureTooltipVisible();
                          },
                          child: Tooltip(
                            key: _toolTipKey,
                            message: 'Read only',
                            child: CustomTextFormField(
                              onChanged: null,
                              icon: Icons.alternate_email,
                              isEnabled: false,
                              labelText: 'Email Address',
                              initialValue: _user.getEmailAddress(),
                              isText: true,
                              validator: (value) {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomMaterialButton(
                          onPressed: () {
                            _submit();
                          },
                          title: 'Update',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
