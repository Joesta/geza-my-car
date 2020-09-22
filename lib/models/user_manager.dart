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

  Future<firebase.User> login(String emailAddress, String password) async {
    return await _auth.signIn(emailAddress, password);
  }

  Future<AuthResultStatus> signUp(String emailAddress, String password) async {
    return await _auth.singUp(emailAddress, password);
  }

  Future<void> saveUser(User user) async {
    print('UserManager: saving user...');
    return await _dataSource.saveUser(user);
  }

  String getUID() => _auth.getUID();

  void logOut() {
    _auth.signOut().then((value) => null);
  }

  void registerUser(Person user) {}
}
