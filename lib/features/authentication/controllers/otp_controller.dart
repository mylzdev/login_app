import 'package:get/get.dart';
import 'package:login_app/features/core/screens/dashboard/dashboard_screen.dart';
import 'package:login_app/repository/auth_repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const DashboardScreen()) : Get.back();
  }
}