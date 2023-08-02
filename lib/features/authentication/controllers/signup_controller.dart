import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/authentication/models/user_model.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';
import 'package:login_app/repository/user_repository/user_repository.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();
  final signupForm = GlobalKey<FormState>();

  RxBool showPassword = false.obs;

  final userRepo = Get.put(UserRepository());
  final authRepo = AuthenticationRepository.instance;

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  Future<void> createUser() async {
    final user = UserModel(
      email: email.text.trim(),
      fullname: fullname.text.trim(),
      password: password.text.trim(),
      phoneNo: phoneNo.text.trim(),
    );

    String? error = await authRepo.createUserWithEmailAndPassword(
        user.email, user.password);

    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error,
        duration: const Duration(seconds: 3),
      ));
    } else {
      userRepo.createUser(user);
      authRepo.setInitialScreen(authRepo.firebaseUser.value);
    }
  }
}
