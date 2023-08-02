import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';
import 'dart:async';

class MailVerificationController extends GetxController {
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }

  Future<void> sendVerificationEmail() async {
    String? error =
        await AuthenticationRepository.instance.sendEmailVerification();

    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
        duration: const Duration(milliseconds: 2000),
      ));
    }
  }

  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        _timer.cancel();
        AuthenticationRepository.instance.setInitialScreen(user);
      }
    });
  }

  void manuallyCheckEmailVerificationStatus() {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified) {
      AuthenticationRepository.instance.setInitialScreen(user);
    }
  }
}
