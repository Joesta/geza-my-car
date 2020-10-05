import 'package:firebase_database/firebase_database.dart';
import 'package:gezamycar/models/user.dart';
import 'package:gezamycar/services/auth_services.dart';
import 'package:gezamycar/utils/constants.dart';

class DataSource {
  final _db = FirebaseDatabase.instance;
  final _auth = AuthServices();
  DatabaseReference _ref;

  DataSource() {
    _ref = _db.reference();
  }

  Future<void> saveOrUpdateUser(User user) async {
    print('DataStore: saveUser ${user.toString()}');
    final _uid = _auth.getUID();
    await _ref.child(kDbUserCollection).child(_uid).update(user.toJson());
  }

  Stream<Event> readUser() {
    final _uid = _auth.getUID();
    return _ref.child(kDbUserCollection).child(_uid).onValue;
  }

  updateLastSignInTime(String timeStamp) {
    final _uid = _auth.getUID();
    _ref
        .child(kDbUserCollection)
        .child(_uid)
        .update({kLstSignInTime: timeStamp});
  }
}
