import 'package:email_validator/email_validator.dart';

class FormValidator {
  static String _fieldRequired = 'Field is required!';
  static String _passwordShort = 'Password too short';
  static String _invalidEmail = 'Invalid email address';
  static int _minPasswordLength = 6;
  static int _maxPasswordLength = 20;

  static String validateEmail({String email}) {
    return email.trim().isEmpty
        ? _fieldRequired
        : !_isEmail(email) ? _invalidEmail : null;
  }

  static String validatePassword({String password}) {
    return password.trim().isEmpty
        ? _fieldRequired
        : !_isPasswordLength(password) ? _passwordShort : null;
  }

  static bool _isEmail(String emailAddress) {
    return EmailValidator.validate(emailAddress);
  }

  static bool _isPasswordLength(String password) =>
      password.length > _minPasswordLength;
}
