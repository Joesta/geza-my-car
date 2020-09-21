import 'package:gezamycar/models/contact.dart';
import 'package:gezamycar/models/person.dart';
import 'package:gezamycar/models/user.dart';

class UserContact {
  User _user;
  Contact _contact;

  void user(Person user) => _user = user;
  void contact(Contact contact) => _contact = contact;
}
