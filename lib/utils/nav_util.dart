import 'package:flutter/cupertino.dart';

class NavUtil {
  static Future<Object> goto(BuildContext context, String route,
      {Object args}) {
    return Navigator.pushNamed(context, route, arguments: args);
  }
}
