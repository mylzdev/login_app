import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();
  RxBool showPassword = false.obs;
  RxBool passwordToggle = false.obs;

  Future<void> login() async {
    String? error =
        await AuthenticationRepository.instance.loginWithEmailAndPassword(
      email.text.trim(),
      password.text.trim(),
    );
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
        duration: const Duration(milliseconds: 2000),
      ));
    }
  }

  validateEmail(String? email) {
    if (!EmailValidator.validate(email!)) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }
}
