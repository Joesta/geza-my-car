import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:gezamycar/database/data_source.dart';
import 'package:gezamycar/enums/auth-result-status.dart';
import 'package:gezamycar/models/person.dart';
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
  Future<void> saveUser(User user) async {
    return await _dataSource.saveUser(user);
  }

  void readData() => _dataSource.readUser();

  // get userId
  String getUID() => _auth.getUID();

  // logs out the current user
  Future<void> logOut() async {
    await _auth.signOut();
  }

  void registerUser(Person user) {}

  // reset password
  Future<AuthResultStatus> resetPassword(String emailAddress) async {
    return await _auth.resetPassword(emailAddress);
  }

  // user metadata
  firebase.UserMetadata get metadata => _auth.metadata;
}
