import 'package:email_validator/email_validator.dart';

class TextFieldValidation {
  static validateEmail(String? email) {
    return !EmailValidator.validate(email!) ? 'Enter valid email' : null;
  }

  static passwordValidation(String? value) {
    return value!.isEmpty ? 'Enter passsword' : null;
  }

  static phoneNoValidation(String? value) {
    return value!.isEmpty ? 'Enter phone number' : null;
  }

  static fullnameValidation(String? value) {
    return value!.isEmpty ? 'Enter fullname' : null;
  }
}
