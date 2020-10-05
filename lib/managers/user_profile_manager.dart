import 'package:gezamycar/database/data_source.dart';
import 'package:gezamycar/models/user.dart';

class UserProfileManager {
  UserProfileManager._internal();
  static final instance = UserProfileManager._internal();
  final _dataSource = DataSource();

  factory UserProfileManager() {
    return instance;
  }

  updateProfile(User user) async {
    await _dataSource.saveOrUpdateUser(user);
  }
}
