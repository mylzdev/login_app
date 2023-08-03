import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';
import 'package:login_app/utils/auth_function/helper.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  // Variables
  final loginFormKey = GlobalKey<FormState>();
  RxBool showPassword = false.obs;
  RxBool passwordToggle = false.obs;
  RxBool isLoading = false.obs;
  RxBool isGoogleLoading = false.obs;

  Future<void> login() async {
    try {
      isLoading.value = true;

      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );
      auth.setInitialScreen(auth.firebaseUser.value);

      isLoading.value = false;

    } catch (e) {
      isLoading.value = false;
      Helper.errorSnackbar(title: tOhSnap, message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      isGoogleLoading.value = true;

      final auth = AuthenticationRepository.instance;
      await auth.signInWithGoogle();

      isGoogleLoading.value = false;

      auth.setInitialScreen(auth.firebaseUser.value);
    } catch (e) {
      isGoogleLoading.value = false;
      Helper.errorSnackbar(title: tOhSnap, message: e.toString());
    }
  }
}
