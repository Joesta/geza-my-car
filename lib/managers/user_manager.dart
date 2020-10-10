import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_database/firebase_database.dart';
import 'package:gezamycar/database/data_source.dart';
import 'package:gezamycar/enums/auth-result-status.dart';
import 'package:gezamycar/models/user.dart';
import 'package:gezamycar/services/auth_services.dart';

class UserManager {
  UserManager._internal();

  static final instance = UserManager._internal();

  final _auth = AuthServices();
  final _dataSource = DataSource();

  factory UserManager() {
    return instance;
  }

  // logs in a user with the provided credentials
  Future<firebase.User> signIn(String emailAddress, String password) async {
    return await _auth.signIn(emailAddress, password);
  }

  // create a user account with the provided
  // email and password
  Future<AuthResultStatus> signUp(String emailAddress, String password) async {
    return await _auth.singUp(emailAddress, password);
  }

  // saves user info database
  Future<void> saveOrUpdate(User user) async {
    return await _dataSource.saveOrUpdateUser(user);
  }

  Stream<Event> readData() => _dataSource.readUser();

  // get userId
  String getUID() => _auth.getUID();

  // logs out the current user
  Future<void> logOut() async {
    await _auth.signOut();
  }

  Future<AuthResultStatus> registerUser(User user) async {
    final _status = await signUp(user.getEmailAddress(), user.getPassword());
    if (_status == AuthResultStatus.successful) {
      await saveOrUpdate(user);
      return _status;
    } else {}
  }

  // reset password
  Future<AuthResultStatus> resetPassword(String emailAddress) async {
    return await _auth.resetPassword(emailAddress);
  }

  // user metadata
  firebase.UserMetadata get metadata => _auth.metadata;

  updateLastSignInTime() {
    _dataSource.updateLastSignInTime(metadata.lastSignInTime.toIso8601String());
  }

  Stream<firebase.User> get currentUser => _auth.authStateChanges;

  String get photoUrl => _auth.photoUrl;
}
