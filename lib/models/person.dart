abstract class Person {
  String _uid;
  String _fistName;
  String _lastName;
  String _gender;
  String _password;

  Person(String uid, String firstName, String lastName, String gender,
      String password) {
    this._uid = uid;
    this._fistName = firstName;
    this._lastName = lastName;
    this._gender = gender;
    this._password = password;
  }

  String get uid => _uid;
  String get fistName => _fistName;
  String get lastName => _lastName;
  String get gender => _gender;
  String get password => _password;

  void login();
  void signUp();
  void resetPassword();
}
