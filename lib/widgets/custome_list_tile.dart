import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData iconData;

  CustomListTile({this.title, this.iconData});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title), leading: Icon(iconData),);
  }
}
