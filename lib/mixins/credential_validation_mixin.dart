import 'package:email_validator/email_validator.dart';
import 'package:gezamycar/utils/constants.dart';

mixin CredentialValidationMixin {
  // validate password
  String validatePassword(String password) => password.isEmpty
      ? kFieldIsRequired
      : !_isPasswordLength(password) ? kPasswordShort : null;

  // validate email address
  String validateEmail(String emailAddress) => emailAddress.trim().isEmpty
      ? kFieldIsRequired
      : !_isEmail(emailAddress) ? kInvalidEmail : null;

  // check password length
  bool _isPasswordLength(String password) => password.length > 6;

  // check if is a valid email
  bool _isEmail(String emailAddress) => EmailValidator.validate(emailAddress);
}
