import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/authentication/screens/forget_password/forget_password_mail/mail_reset_password_sent.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';
import 'package:login_app/utils/auth_function/helper.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final email = TextEditingController();
  final forgotPasswordKey = GlobalKey<FormState>();

  late final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future<void> sendPasswordResetCodeToEmail() async {
    try {
      _isLoading.value = true;
      await AuthenticationRepository.instance
          .sendPasswordResetCode(email.text.trim());

      _isLoading.value = false;
      Get.to(const MailResetPasswordScreen());
    } catch (e) {
      _isLoading.value = false;
      Helper.errorSnackbar(title: tOhSnap, message: e.toString());
    }
  }

}
