import 'package:firebase_database/firebase_database.dart';
import 'package:gezamycar/models/user.dart';
import 'package:gezamycar/services/auth_services.dart';
import 'package:gezamycar/utils/constants.dart';

class DataSource {
  final _db = FirebaseDatabase.instance;
  DatabaseReference _ref;

  DataSource() {
    _ref = _db.reference();
  }

  Future<void> saveUser(User user) async {
    return await _ref.child(kDbUserCollection).push().set(user.toJson());
  }

  void readUser() {
    final _auth = AuthServices();
    _ref.child(kDbUserCollection).child(_auth.getUID()).onValue.listen((event) {
      //@Todo (developer) do something about this user info
    });
  }
}
