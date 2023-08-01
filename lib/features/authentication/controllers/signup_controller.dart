import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/features/authentication/models/user_model.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';
import 'package:login_app/repository/user_repository/user_repository.dart';

import '../../core/screens/dashboard/dashboard_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> registerUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);

    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
        duration: const Duration(
          milliseconds: 2000,
        ),
      ));
    }
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
    Get.to(() => const DashboardScreen());
  }
}
