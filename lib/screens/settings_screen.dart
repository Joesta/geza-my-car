import 'package:flutter/material.dart';
import 'package:gezamycar/managers/user_manager.dart';
import 'package:gezamycar/screens/login_screen.dart';
import 'package:gezamycar/utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = 'SettingsScreen';
  final _manager = UserManager.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Settings',
            style: TextStyle(letterSpacing: 2.0),
          ),
          backgroundColor: Colors.white24.withOpacity(.2),
        ),
        backgroundColor: kBackgroundColor,
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
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  height: 50,
                  onPressed: () {},
                  child: Align (
                    alignment: Alignment.centerLeft,
                    child: Text('Service History', style: TextStyle(fontSize: 18.0),),
                  ),
                  color: Colors.grey[700],
                  minWidth: MediaQuery.of(context).size.width,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
