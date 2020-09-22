import 'package:firebase_database/firebase_database.dart';
import 'package:gezamycar/models/user.dart';

class DataSource {
  final _db = FirebaseDatabase.instance;
  DatabaseReference _ref;

  DataSource() {
    _ref = _db.reference();
  }

  Future<void> saveUser(User user) async {
    await _ref.child('users').push().set(user.toJson());
    print('DataSource: user ${user.toJson()} is saved');
  }
}
