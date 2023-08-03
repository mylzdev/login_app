import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/authentication/models/user_model.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';
import 'package:login_app/repository/user_repository/user_repository.dart';
import 'package:login_app/utils/auth_function/helper.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // Form
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();
  final signupForm = GlobalKey<FormState>();

  // Variables
  RxBool showPassword = false.obs;
  RxBool isLoading = false.obs;

  // Instance
  final userRepo = Get.put(UserRepository());
  final authRepo = AuthenticationRepository.instance;

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  // Sign up using email and pass and store in firestore
  Future<void> createUser() async {
    try {
      isLoading.value = true;
      final user = UserModel(
        email: email.text.trim(),
        fullname: fullname.text.trim(),
        password: password.text.trim(),
        phoneNo: phoneNo.text.trim(),
      );

      await authRepo.signUpWithEmailAndPassword(user.email, user.password);
      // Firestore database
      userRepo.createUser(user);
      // Set user screen
      authRepo.setInitialScreen(authRepo.firebaseUser.value);
      isLoading.value = false;
      
    } catch (e) {
      isLoading.value = false;
      Helper.errorSnackbar(title: tOhSnap, message: e.toString());
    }
  }
}
