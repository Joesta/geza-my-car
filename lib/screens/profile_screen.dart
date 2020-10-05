import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gezamycar/database/data_source.dart';
import 'package:gezamycar/managers/user_manager.dart';
import 'package:gezamycar/models/user.dart';
import 'package:gezamycar/screens/login_screen.dart';
import 'package:gezamycar/screens/profile_edit_screen.dart';
import 'package:gezamycar/utils/colors.dart';
import 'package:gezamycar/utils/constants.dart';
import 'package:gezamycar/widgets/custom_material_button.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';
  final _manager = UserManager.instance;
  final _dataSource = DataSource();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(letterSpacing: 2.0),
          ),
          backgroundColor: Colors.white24.withOpacity(.2),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _manager.logOut();
            Navigator.pushNamedAndRemoveUntil(
                context, LoginScreen.id, (route) => false);
          },
          label: Text(
            'Log Out',
            style: TextStyle(letterSpacing: 2.0),
          ),
          icon: Icon(Icons.exit_to_app),
          backgroundColor: Colors.red[300],
        ),
        backgroundColor: kBackgroundColor,
        body: StreamBuilder(
          stream: _dataSource.readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final User _user = User.fromDataSnapshot(snapshot.data.snapshot);
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  print('active');
                  return Container(
                    child: Center(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Hero(
                                    tag: 'editProfile',
                                    child: CircleAvatar(
                                      radius: 85.0,
                                      backgroundImage:
                                          AssetImage('images/skull.JPG'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    height: 2.0,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Card(
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.person_pin,
                                        color: kColorBlack,
                                      ),
                                      title: Text('${_user.getFirstName()}'),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.alternate_email,
                                        color: kColorBlack,
                                      ),
                                      title: Text('${_user.getLastName()}'),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.phone,
                                        color: kColorBlack,
                                      ),
                                      title: Text('${_user.getPhoneNumber()}'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  CustomMaterialButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, ProfileEditScreen.id,
                                          arguments: _user);
                                    },
                                    title: 'Update Profile',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  print('waiting');
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  );
                  break;
                case ConnectionState.done:
                  print('done');
                  break;
                case ConnectionState.none:
                  print('none');
                  break;
              }
            } else if (snapshot.hasError) {
              print('has errro');
              return Container(); // @Todo (developer) handle error correctly
            }

            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
